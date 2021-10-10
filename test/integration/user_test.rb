require 'test_helper'

class UserTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
    include Capybara::DSL


 test 'UserHome' do
   init_screenshot_folder(self,"Userhome","Login as user")
   basic_auth("mohamed@ontash.net", "123456789")

   sleep(5)
   take_screenshot('On Userhome Page')
   #visit admin_home_path
    assert page.has_content? 'Hashib'
    
    click_on('UI Kit')
    click_link('Alerts') 
    take_screenshot('Alerts page')
    sleep(2)
    assert page.has_content? 'Alerts'

    click_link('Badges') 
    take_screenshot('Badges')
    sleep(2)
    assert page.has_content? 'Badges'

    visit('/component/data-table')
    take_screenshot('Data table')
    sleep(2)
    assert page.has_content? 'DATA TABLE'



   
   #assert page.has_content? 'ADD NEW CATEGORY' 
	end
end
