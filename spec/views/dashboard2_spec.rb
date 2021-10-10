require "rails_helper"


RSpec.feature "user logs in" do
 scenario "Dashbord page2" do
   
    visit unauthenticated_root_path
    
      
    expect(page).to have_content("Login to your account")
    stub_omniauth
    visit user_twitter_omniauth_authorize_path
    expect(page).to have_content("Successfully authenticated from Twitter account.")
    expect(page).to have_content("Welcome #i b")
    
    click_link  'UI Kit'

    expect(page).to have_text("Badges")
    click_link 'Badges'
    expect(page).to have_content("Badges scale to match the size of the immediate parent element by using relative font sizing and em units.")

   
  end
end
def stub_omniauth
  # first, set OmniAuth to run in test mode
 
  # then, provide a set of fake oauth data that
 # then, provide a set of fake oauth data that
  OmniAuth.config.test_mode = true
   OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      :provider => "twitter",
      :info => {
        :name => "hashib",
        :email => "moahamed@ontash.net"

        
      },
      :credentials => {
        :token => "token",
        :refresh_token => "refresh token",
        :password => "Hashib@1996"
      }
    }
  )
end
