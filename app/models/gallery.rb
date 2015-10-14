class Gallery < ActiveRecord::Base
	has_many :gallery_attachments
   accepts_nested_attributes_for :gallery_attachments
  has_many :comments, as: :commentable
  belongs_to :user
end
