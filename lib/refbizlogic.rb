module 
  REFBIZLOGIC

  # define custom exception
  class CustomException < Exception
  end

  def self.getProfile(current_user)

    chk_current_user!(current_user)
    current_user.profile

  end

  def self.chk_current_user!(current_user)

    if current_user.nil? 
      raise CustomException.new("user not defined")
    end

    User.find_by!(id: current_user.id)
    return true

  end

   def self.getProfileById(id)

    profile= Profile.find_by!(id: id.to_i)

    if profile.nil?
       raise CustomException.new("profile not defined")
    end

    profile
  end

  def self.updateProfile(user,firstname,lastname, about_me, avatar,birthdate,sex)

      profile = getProfile(user)
    

      
      unless firstname.nil?
           profile.first_name = firstname
      end
      unless lastname.nil?
         profile.last_name = lastname
      end
      unless birthdate.nil? 
        profile.birthdate = birthdate end
      unless sex.nil?
           profile.sex = sex
      end
      unless about_me.nil?
         profile.about_me = about_me
      end

      if !avatar.nil?

      profile.avatar.purge
      profile.avatar.attach(avatar)
      end
      profile.save

  end
  def self.updateUserbyId(id,fname,sname,phn)
    profile= Profile.find_by!(id: id.to_i)
              unless fname.nil?
                profile.first_name = fname
           end
           unless sname.nil?
            profile.last_name = sname
            end
            unless phn.nil?
              profile.phone = phn
              
            end
           profile.save

  end
  def self.upload_image(user,avatar)
      profile = getProfile(user)
       if !avatar.nil?
        profile.avatar.purge
        profile.avatar.attach(avatar)
      end
        profile.save
  end

  def self.chk_admin_user!(current_user)
      if current_user.nil?
        raise CustomException.new("user not defined")
      end
      user = User.find_by!(id: current_user.id)
      if user.admin?
        return true
      end
        return false
  end

  def self.getAllUsers(current_user)
      if chk_admin_user!(current_user)
        return User.all

      else
          nil
      end 

  end

  def self.revokeAdmin(user_id)
      if user_id.nil?
        raise CustomException.new("user not defined")
      end
      user = User.find_by!(id: user_id)
      user.role = :user
      user.save
  end

  def self.makeAdmin(user_id)
      if user_id.nil?
        raise CustomException.new("user not defined")
      end
      user = User.find_by!(id: user_id)
      user.role = :admin
      user.save
  end

  def self.deleteUser(user_id)
      if user_id.nil?
        raise CustomException.new("user not defined")
      end
      user = User.find_by!(id: user_id)
      user.destroy

  end

  def self.create_user(current_user,email,name,password,passord_confirm)
      if chk_admin_user!(current_user)
         @user=User.find_by_email(@email)

         if (!@user.blank?)

           nil        
        else
          user = User.new(
                        :email                 => email,
                        :name                  => name,
                        :password              => password,
                        :password_confirmation => passord_confirm,
                        
                    )
          user.save!
          return true
        end

      else
          nil
      end 
  end

  def self.deleteUser(user_id)
      if user_id.nil?
        raise CustomException.new("user not defined")
      end
      user = User.find_by!(id: user_id)
      user.destroy

  end

  

end