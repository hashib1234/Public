require 'rails_helper'
include Capybara::DSL


RSpec.describe "login page open" do
    it "login page contains all expected controls" do
     
      
       user = FactoryGirl.create(:user)
       visit new_user_session_path
       fill_in "user[login]", :with => user.email
  	   fill_in "user[password]", :with => user.password
       click_button("Login")
  	   page.should have_content("Signed in successfully.") 
      
    end
  end

