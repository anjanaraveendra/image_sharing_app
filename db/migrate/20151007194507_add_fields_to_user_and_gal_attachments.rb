class AddFieldsToUserAndGalAttachments < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :gallery_attachments, :tag_line, :string
  end
end
