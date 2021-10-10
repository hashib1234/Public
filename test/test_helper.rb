ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'capybara'
require 'capybara/dsl'
require 'capybara/rails'
require 'selenium-webdriver'
require 'fileutils'

class ActiveSupport::TestCase


class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  @@screenshot_index = 1
  include Capybara::DSL
  @@device_config_by_name = {
    :mobile_generic => { :size => [490,800],    
                         :ua => ''
                         },
    #:mobile_iphone5s => { :size => [ 320,568 ],    
                        # :ua => 'Mozilla/5.0 (iPhone; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.'
                         #},
    #:tablet_ipadair => { :size => [ 768,1024 ],    
                         #:ua => 'Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B334b Safari/531.21.10'
                         #},
    #:tablet_generic => { :size => [ 960, 640],
                         #:ua => ''
                         #},

    :desktop_generic => { :size => [1280, 900],
                         :ua => ''
                          }
  }

  @@current_device_config_name = :desktop_generic
  
  def set_device_config(name)
    puts "requested device config = #{name}"
    config = @@device_config_by_name[name]
    if config.nil?
      @@current_device_config_name = :mobile_generic
    else
      @@current_device_config_name = name
    end
    @@screen_size = @@device_config_by_name[@@current_device_config_name][:size]
    @@ua = @@device_config_by_name[@@current_device_config_name][:ua]
    puts "Testing with config: #{@@current_device_config_name}"
  end


  def init_screenshot_folder(obj,test_name,description)
    puts 'init screenshot'
    folder = obj.class.name
    @@screenshot_dir =  Rails.root.join('tmp', 'screenshots', @@current_device_config_name.to_s,folder,test_name)
    FileUtils::mkdir_p @@screenshot_dir
    Dir::glob(@@screenshot_dir+'*.png').each { |file| File.delete(file)}
    Dir::glob(@@screenshot_dir+'*.txt').each { |file| File.delete(file)}
    f =  File.open(File.join(@@screenshot_dir, "desc.txt"),"w")
    f.puts description
    f.close
  end

  def take_screenshot(description)
    img_file = "#{@@screenshot_index}.png"
    txt_file = "#{@@screenshot_index}.txt"
    @@screenshot_index =     @@screenshot_index + 1
    #save_screenshot(File.join(@@screenshot_dir, img_file))
    save_and_open_screenshot(File.join(@@screenshot_dir, img_file))
    f =  File.open(File.join(@@screenshot_dir, txt_file),"w")
    f.puts description
    f.close
    puts "--------------------inside test_helper index----------------#{@@screenshot_index.to_s}" 
    puts "--------------------inside test_helper description----------------#{description.to_s}" 
  end

  def setup_browser()
    if @@ua !=  ''
      Capybara.page.driver.headers = { 'User-Agent' => @@ua }
    end
    #Capybara.visit('/')
    #puts "set browserrrrrrrr"+@@screen_size[0].to_s
    #puts "set browserrrrrrrr"+@@screen_size[1].to_s

    #Capybara.page.current_window.resize_to(@@screen_size[0],@@screen_size[1])
    #puts 'here'
    #@driver = Selenium::WebDriver.for :chrome
    #puts 'end'
    #@driver.manage.window.resize_to(@@screen_size[0],@@screen_size[1])


  end



  setup do
    # get screen size
    requested_device_config_name = ENV['TEST_DEVICE_CONFIG'] 
    if ! requested_device_config_name.nil? 
      set_device_config(requested_device_config_name.parameterize.underscore.to_sym)
    else
      set_device_config(:mobile_generic)
    end
    docker_ip=%x(/sbin/ip route|awk '/default/ { print $3 }').strip
    if ENV['SELENIUM_REMOTE_HOST']
      Capybara.configure do |config|
      #puts "configggggg"+@@screen_size[0].to_s
      #config.run_server = true
      config.app_host   =  "http://#{docker_ip}:3000"
      puts "config.app_host= #{config.app_host.to_s}"
      Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app,
           :browser => :remote,
           :url => "http://#{ENV['SELENIUM_REMOTE_HOST']}:4444/wd/hub",
           :desired_capabilities => :chrome
          )
       end
      config.default_driver = :selenium # :poltergeist by default
      Capybara.default_max_wait_time = 50
      #puts "after visit"
      setup_browser()
       end
     else 
=begin
    Capybara.configure do |config|
      #puts "configggggg"+@@screen_size[0].to_s
      #config.run_server = true
      config.app_host   =  "http://localhost:3000"
      #config.app_host   =  'http://foodappdev.ontash.org:3000'
      puts "config.app_host= http://localhost:3000"
      #config.app_host   =  "http://#{docker_ip}:3000"
      Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
      end
      config.default_driver = :selenium # :poltergeist by default
      config.app_host = 'https://www.google.com'
      Capybara.default_max_wait_time = 50
      Capybara.visit('/')
      puts "after visit"
      setup_browser()
    end
=end
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new app, browser: :chrome,url: 'http://localhost:9515' 
  end

Capybara.javascript_driver = :chrome

Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver        = :chrome
  config.app_host   =  "http://localhost:3000"
end
puts 'config ends'
Capybara.use_default_driver
Capybara.visit('/')
puts 'success'
  end
end




  # Reset sessions and driver between tests
  # Use super wherever this method is redefined in your individual test classes
  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  def basic_auth(email,password)
    visit('/users/sign_in')
    #assert_response :success
    #take_screenshot('On home page')
    #assert page.has_content? 'Forgot Password' 
    #assert page.has_content? 'Register' 
    page.find('.email').set(email)
    page.find('.password').set(password)
    take_screenshot('Before logging in')
    click_button 'Login'
    take_screenshot('After logging in')
  end  
  def google_omniauth
  # first, set OmniAuth to run in test mode
 
  # then, provide a set of fake oauth data that
  visit('/users/sign_in')
  click_on(class: 'btn-google')
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      :provider => "google_oauth2",
      :uid => "123456789",
      :info => {
        :name => "mohamed hashib",
        :email => "mohamed@ontash.net"
      },
      :credentials => {
        :token => "token",
        :refresh_token => "refresh token"
      }
    }
  )
end
end


end
