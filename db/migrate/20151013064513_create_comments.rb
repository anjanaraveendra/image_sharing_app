class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :description
      t.integer :gallary_type_id
      t.string :gallary_type

      t.timestamps null: false
    end
  end
end
