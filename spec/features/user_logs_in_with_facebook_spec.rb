require 'rails_helper'
include Capybara::DSL

RSpec.feature "user logs in" do
  scenario "using facebook oauth2" do
   
    visit unauthenticated_root_path
    
    expect(page).to have_content("Login to your account")
    stub_omniauth
    visit  user_facebook_omniauth_authorize_path
    expect(page).to have_content("Successfully authenticated from Facebook account")
    click_link('Log Out')
    expect(page).to have_content("Signed out successfully")
    
    


   
  end
end
def stub_omniauth
  # first, set OmniAuth to run in test mode
 
  # then, provide a set of fake oauth data that
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      :provider => "facebook",
      :info => {
        :name => "anjal",
        :email => "anjal@ontash.net"

        
      },
      :credentials => {
        :token => "token",
        :refresh_token => "refresh token",
        :password => "testpass"
      }
    }
  )
end