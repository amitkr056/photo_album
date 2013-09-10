class Addimagefilenametophotos < ActiveRecord::Migration
  def up
  	add_column :photos, :image_file_name, :string
  end

  def down
  	remove_column :photos, :image_file_name
  end
end
