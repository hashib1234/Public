require "rails_helper"


RSpec.feature "user logs in" do
  scenario "Dashboard page" do
   
    visit unauthenticated_root_path
    
    expect(page).to have_content("Login to your account")
    stub_omniauth
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to have_content("Welcome mohamed hashib")
    find('a[href*="user_profile.1"]').click  
    expect(page).to have_content('mohamed@ontash.net')
    expect(page).to have_content('About')
    expect(page).to have_content('Edit profile')
    find("a", :text => 'Edit profile').click
    expect(page).to have_content('First name')
    fill_in 'profile_first_name', :with => 'Mohamed'
    expect(page).to have_content('Last name')
    fill_in 'profile_last_name', :with => 'Hashib yp'
    assert page.has_select? 'profile_sex'
    select"Male", :from => "profile_sex"
    expect(page).to have_content('Last name')
    expect(page).to have_content('About me')
   
    fill_in 'profile_birthdate', with:  DateTime.parse('20191004').strftime("%m/%d/%Y")
    fill_in 'profile_about_me', :with => 'I am hashib , i am from Tanur'
    find('input[name="commit"]').click
    find('a[href*="user_profile.1"]').click  
    expect(page).to have_content('I am hashib , i am from Tanur')
    expect(page).to have_content('04/10/2019')


     
   
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
