class GalleryAttachment < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	 has_many :comments, as: :commentable
   belongs_to :gallery
   belongs_to :user
end
