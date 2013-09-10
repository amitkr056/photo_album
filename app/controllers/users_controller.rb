class UsersController < ApplicationController
  def index
  	if user_signed_in?
  		@album=[]
  		@album= PhotoAlbum.find_all_by_user_id(current_user.id) 
  		@photos = Photo.all
      sums = Photo.select("sum(id) as a, sum(photo_album_id) as b").first
      sums1 = Photo.find_by_sql("select sum(id) as a, sum(photo_album_id) as b from photos").first
  	end
  end

end