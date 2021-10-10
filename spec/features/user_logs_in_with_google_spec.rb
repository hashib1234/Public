require 'rails_helper'
include Capybara::DSL

RSpec.feature "user logs in" do
  scenario "using google oauth2" do
   
    visit unauthenticated_root_path
    
    expect(page).to have_content("Login to your account")
    stub_omniauth
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to have_content("Welcome mohamed hashib")
    expect(page).to have_content("Log Out")
    click_link('Log Out')
    expect(page).to have_content("Signed out successfully")
    


   
  end
end
def stub_omniauth
  # first, set OmniAuth to run in test mode
 
  # then, provide a set of fake oauth data that
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
