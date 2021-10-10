class PagesController < ApplicationController
	def index
	end
	def user_home
		if current_user.admin? 
     		redirect_to admin_home_path and return
     	 end
     	 logger.info "signed in as #{current_user}"
	end
	
end
