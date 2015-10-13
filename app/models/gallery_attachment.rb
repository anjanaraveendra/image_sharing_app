class GalleryAttachment < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
   belongs_to :gallery
   belongs_to :user
   has_many :comments, as: :gallary_type
end
