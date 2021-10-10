require "rails_helper"


RSpec.feature "Spec for Sign Up" do
 scenario "should create new user account" do
   
     visit unauthenticated_root_path
    
      
    expect(page).to have_content("Login to your account")
    click_link('Sign Up Free!')
    expect(page).to have_content("Sign up for free!")
    user = FactoryGirl.create(:user)
    fill_in 'user[email]',  :with => user.email
    fill_in 'user[name]',:with => user.password
    fill_in 'user[phone_no]', :with => user.phone_no
    fill_in 'user[password]',:with => user.password
    fill_in 'user[password_confirmation]',:with => user.password
    click_button ('Sign Up')
    expect(page).to have_content("A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.")
  end
end
def seed_data
  require "#{Rails.root}/db/seeds.rb"
end
