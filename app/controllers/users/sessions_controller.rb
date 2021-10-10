class Users::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]
  # POST /resource/sign_in
   def create
         if  params["submit_btn"] == "Request_OTP"
          logger.info params[:user]["login"]
          if params[:user]["login"] !~ /\D/
           @user = User.find_by(phone_no: params[:user]["login"])
          else
           @user = User.find_by(email: params[:user]["login"])
          end
          if @user.nil?
           set_flash_message(:error, "User is not found with us....Please register")
           redirect_to '/'  and return
          end 
          @user.otp_required_for_login = true
          @user.otp_secret= User.generate_otp_secret
          @otp = @user.current_otp
          @user.save
          logger.info 'OTP------:'+@otp.to_s
          OtpMailer.with(user: @user, otp:@otp).sent_email_otp.deliver_now 
          render "edit_otp"
        else
        self.resource = warden.authenticate!(auth_options)
        if current_user.admin? 
          respond_with resource, :location =>  after_admin_sign_in_path_for(resource)
        else
          respond_with resource, :location =>  after_user_sign_in_path_for(resource)
        end 
       end 
  end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:otp_attempt,:phone_no])
   end

   def verify_otp
    @user = User.find_by(email: params[:user]["email"])
    @otp = params[:user]["otp_attempt"]
    if @user.validate_and_consume_otp!(@otp)
       @user.otp_required_for_login = false
      sign_in_and_redirect @user, event: :authentication
    else 
      redirect_to '/'
    end
   end
   private
   def sent_sms_otp(user,otp)
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOCKEN'])
    from = '+15412165752' #  Twilio number
    to = '+919961131818' # need to change users phone no.
    @client.messages.create(
    from: from,
    to: to,
    body: "Hey, your otp for Ref #{otp}"
    )
       end
end
