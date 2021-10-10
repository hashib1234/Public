require 'factory_girl'


FactoryGirl.define do
	factory :user do
	 sequence(:email) {"anjal@ontash.net"}
	 password {"12369874"}
	 phone_no {"8523697412"}
	 name {"aswani"}

	end
end