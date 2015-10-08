class AddIdsToGalleryAttachments < ActiveRecord::Migration
  def change
  	add_reference :gallery_attachments, :user, index: true
  end
end
