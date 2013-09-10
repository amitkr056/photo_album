class UsersController < ApplicationController
  def index
  	p "?????????????????+++++++++++++++++++"
  	p params
  	p user_signed_in?
    p current_user
    p session
    p "??????????????????????????????????????"
  	if user_signed_in?
  		@album=[]
  		@album= PhotoAlbum.find_all_by_user_id(current_user.id) 
  		@photos = Photo.all
      sums = Photo.select("sum(id) as a, sum(photo_album_id) as b").first
      sums1 = Photo.find_by_sql("select sum(id) as a, sum(photo_album_id) as b from photos").first
      #sums2 = Photo.get_sum_for_colums
      #p sums2
      p sums
      p sums1[:a]
      p sums[:a].to_s
      p sums[:b].to_s
      p "+++++++++++++++++++++++++++++++++++++"
      #p @photos
      p @photos.kind_of?(Array)
      p "+++++++++++++++++++++++++++++++++++++"
  	end
  end

end