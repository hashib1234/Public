class OtpMailer < ApplicationMailer
	default from: 'hashibyp@gmail.com'
 
  def sent_email_otp
    @user = params[:user]
    @otp = params[:otp]
    mail(to: @user.email, subject: 'app OTP')
  end
end
