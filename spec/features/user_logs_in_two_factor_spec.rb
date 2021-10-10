require 'rails_helper'
include Capybara::DSL

RSpec.feature "user logs in Two factor" do
  scenario "Two factor" do
   
    visit unauthenticated_root_path
    
    expect(page).to have_content("Login to your account")

    fill_in 'user[login]', with: "mohamed@ontash.net"

  
    click_button ('Request_OTP')
    expect(page).to have_content("Verify the OTP")
    
    


   
  end
end
