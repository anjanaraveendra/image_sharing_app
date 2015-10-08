class AddUserIdToGallery < ActiveRecord::Migration
  def change
  	add_reference :galleries, :user, index: true
  end
end
