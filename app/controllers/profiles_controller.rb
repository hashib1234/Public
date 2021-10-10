class ProfilesController < ApplicationController
	
	before_action :authenticate_user! 
	skip_before_action :verify_authenticity_token, only: [:upload_image]

	def show
		@profile = REFBIZLOGIC.getProfile(current_user) 
	end

	def edit
		@profile = REFBIZLOGIC.getProfile(current_user)
	end

	def update
		first_name = params[:profile][:first_name]
		last_name = params[:profile][:last_name]
		sex = params[:profile][:sex]
		birthdate = params[:profile][:birthdate]
		about_me = params[:profile][:about_me]
		avatar = params[:profile][:avatar]
		REFBIZLOGIC.updateProfile(current_user,first_name,last_name, about_me, avatar,birthdate,sex)
		
		redirect_to user_session_path
		
	end
	def upload
		
	end
	def upload_image
		REFBIZLOGIC.upload_image(current_user,params["myFile"])
		redirect_to user_session_path
	end
	
end
