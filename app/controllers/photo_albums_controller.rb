class PhotoAlbumsController < ApplicationController

	def new
		@album = PhotoAlbum.new
		5.times {@album.photos.build}
	end

	def create
		@user = current_user
		@album = @user.photo_albums.new(params[:photo_album])
		if @album.save
			begin
				UserMailer.send_email_to_user(current_user, @album).deliver
			rescue Exception => e
				flash[:error] = e.message
			end
			flash[:notice] = "Album created Successfully."
			respond_to do |format|
          		format.html {redirect_to root_path}
          		format.js   {render :action => 'success'}
        	end
		else
			5.times {@album.photos.build}
			render :action => "new"
		end
	end

	def add_photo
		@album = PhotoAlbum.find(params[:id])
		5.times {@album.photos.build}
	end

	def update_photo_album
		@album = PhotoAlbum.find(params[:id])
    	if @album.update_attributes(params[:photo_album])
    		flash[:notice] = "Successfully added photos to album."
      		redirect_to root_path
    	else
      		render :action => 'add_photo'
    	end
	end

	def modal_pop_up
		@test_model= TestModel.new(params[:modal_box])
		if @test_model.save
			@success = true
		else
			@success = false
		end
		respond_to do |format|
  		format.js { render :partial => "success" }
		end
	end

end