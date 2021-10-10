require 'rails_helper'
include Capybara::DSL

RSpec.feature "user logs in" do
  scenario "using twitter oauth2" do
   
    visit unauthenticated_root_path
    
      
    expect(page).to have_content("Login to your account")
    stub_omniauth
    visit user_twitter_omniauth_authorize_path
    expect(page).to have_content("Successfully authenticated from Twitter account.")
    expect(page).to have_content("Welcome hashib")
    click_link('Log Out')
    expect(page).to have_content("Signed out successfully")
 end
end
def stub_omniauth
  # first, set OmniAuth to run in test mode
 
  # then, provide a set of fake oauth data that
  OmniAuth.config.test_mode = true
   OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      :provider => "twitter",
      :info => {
        :name => "hashib",
        :email => "hashibyp@gmail.com"

        
      },
      :credentials => {
        :token => "token",
        :refresh_token => "refresh token",
        :password => "Hashib@1996"
      }
    }
  )
end
