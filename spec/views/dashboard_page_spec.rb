require "rails_helper"


RSpec.feature "user logs in" do
  scenario "Dashboard page" do
   
    visit unauthenticated_root_path
    
    expect(page).to have_content("Login to your account")
    stub_omniauth
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to have_content("Welcome mohamed@ontash.net")
    click_link  'UI Kit'

    expect(page).to have_text("Alerts")
    click_link 'Alerts'
    expect(page).to have_content("Alerts are available for any length of text, as well as an optional dismiss button. For proper styling, use one of the eight required contextual classes (e.g., .alert-success).")

   
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
