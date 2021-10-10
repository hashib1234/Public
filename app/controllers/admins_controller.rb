class AdminsController < ApplicationController
	before_action :authenticate_user!

	def admin_home
		@users = REFBIZLOGIC.getAllUsers(current_user)
      
        
	 
		if @users.nil?
		 flash[:error] = "You don't have permisson to see the page... "
		 redirect_to new_user_session_path
		end  
	end

	def revoke_admin
		user_id = params[:id]
		REFBIZLOGIC.revokeAdmin(user_id)
		# render json:{data: 'Revoked the role as admin'}
		redirect_to admin_home_path
	end
	

	def make_admin
		user_id = params[:id]
		REFBIZLOGIC.makeAdmin(user_id)
		# render json:{data: 'Changed user as admin'}
		redirect_to admin_home_path
	end

	def destroy
		user_id = params[:id]
		REFBIZLOGIC.deleteUser(user_id)
		# render json:{data: 'Deleted the user'}
		redirect_to admin_home_path
	end	
	def edit

		user_id = params[:id]
		@profile = REFBIZLOGIC.getProfileById(user_id)
		 respond_to do |format|
     	 format.json { render :json => @profile}
     	  end

	end
	def update 
		user_id = params[:id]
		@first_name = params[:fname]
		@last_name = params[:sname]
		@phn = params[:phn_no]
        REFBIZLOGIC.updateUserbyId(user_id,@first_name,@last_name,@phn_no)
		redirect_to user_session_path

	end



	def create_user
		@email = params[:email]
		@name = params[:fname]
		@password = params[:pwd]
		@password_confirm = params[:pwd_confirm]
		if REFBIZLOGIC.create_user(current_user,@email,@name,@password,@password_confirm)
			flash[:success] = "User successfully created!"
		else
			flash[:error] = "User not created !"
		end	
		redirect_to admin_home_path
	end
end
