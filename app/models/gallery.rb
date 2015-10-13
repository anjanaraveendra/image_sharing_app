class Gallery < ActiveRecord::Base
	has_many :gallery_attachments
  accepts_nested_attributes_for :gallery_attachments
  belongs_to :user
  has_many :comments, as: :gallary_type
end
