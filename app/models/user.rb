class User < ApplicationRecord
  devise :two_factor_authenticatable,
         :otp_secret_encryption_key => ENV['ENCRYPTION_KEY']

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :two_factor_authenticatable,
         :registerable, :rememberable, :validatable, :recoverable, 
         :lockable, :trackable, :omniauthable,
         :omniauth_providers => [:google_oauth2,:twitter, :facebook],
         :otp_secret_encryption_key => ENV['ENCRYPTION_KEY'],authentication_keys: [:login]
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_one :profile, dependent: :destroy
  
  #for chat module
  has_many :messages , :dependent => :destroy
  has_many :conversations, foreign_key: :sender_id , :dependent => :destroy


  before_save :ensure_profile,:check_email
  validates :phone_no,
            :numericality => true,
            :length => { :minimum => 10, :maximum => 10 },:allow_blank => true
  attr_accessor :login

  def login=(login)
    @login = login
  end


  def login
    @login || self.phone_no || self.email
  end


	def ensure_profile
	  self.profile ||= Profile.new
	  profile.save
	end



  def check_email
    if !self.email.present?
      skip_confirmation!
    end
  end

  def set_default_role
    self.role ||= :user 
   end  

   def self.from_omniauth(auth)
      where(provider: auth.provider, email: auth.info.email).first_or_create! do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.name = auth.info.name   # assuming the user model has a name
        #user.image = auth.info.image # assuming the user model has an image
        # If you are using confirmable and the provider(s) you use validate emails, 
         # user.skip_confirmation!
        end
   end

   def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_hash).where(["phone_no = :value OR email = :value", { :value => login }]).first
      elsif conditions.has_key?(:phone_no) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end
end
