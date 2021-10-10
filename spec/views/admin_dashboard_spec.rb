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