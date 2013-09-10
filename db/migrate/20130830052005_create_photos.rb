class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.integer :photo_album_id
    	t.string :image_filename
    	t.string :image_content_type
    	t.integer :image_file_size
    	t.datetime :image_updated_at

      t.timestamps
    end
  end
end
