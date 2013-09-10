require 'test_helper'

class PhotoAlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

 test "should not save Album without name" do
  album = PhotoAlbum.new
  assert !album .save, "Saved the album without a name"
end


end