class GalleryAttachment < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
   belongs_to :gallery
   belongs_to :user
end
