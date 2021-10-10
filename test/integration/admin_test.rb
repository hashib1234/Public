require 'test_helper'

class AdminTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
   include Capybara::DSL


 test 'AdminHome' do
   init_screenshot_folder(self,"adminhome","Login as Admin and go to Admin Home page")
   basic_auth("aswanim@ontash.net", "12369874")

   sleep(5)
  
 
   click_link('Make Admin')
   sleep(5)
   page.driver.browser.switch_to.alert.accept
   sleep(2)
   take_screenshot('Change Role for User')
   
   sleep(5)
  
   #Add new User in admin
   
    take_screenshot('On Add new user')
    assert page.has_content? 'Add New User' 
    click_button 'Add New User'
    sleep(2)
    page.find('#email').set("akhil@ontash.net")
    page.find('#fname').set("akhil")
    page.find('#pwd').set("akhil123")
    page.find('#pwd_confirm').set("akhil123") 
    
    take_screenshot('After filling in  Add new user ')
    page.find("#new_user").click
    take_screenshot('After clicking on submit')
    #assert page.has_content? 'success' 



   #Delete user for adamin
   
   take_screenshot("Delete user")
   page.all('.feather-delete').last.click
   

   page.driver.browser.switch_to.alert.accept
   sleep(2)
   take_screenshot("after Delete user")
   #visit admin_home_path
   
   #assert page.has_content? 'ADD NEW CATEGORY' 
	end
end