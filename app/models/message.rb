class Message < ApplicationRecord
	include Rails.application.routes.url_helpers
  belongs_to :user
  belongs_to :conversation

  def as_json(options)
	  super(options).merge(user_avatar_url: user_image_url,user_name: user.name,user_email: user.email,user_id:user.id)
  end

  private

  def user_image_url
  	rails_blob_path(self.user.profile.avatar, disposition: "attachment", only_path: true)
  end

end
