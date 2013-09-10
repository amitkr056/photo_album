class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_email_to_user(recipient, album)
  	p "SEND Email++++++++++++++++++++++++++++++"
  	@user = recipient
  	@album = album
    album.photos.each do |photo|
      image_url = []
      image_url = photo.image.url(:medium).split("?")
      attachments[photo.image_file_name] = File.read("#{Rails.root}/public" + image_url[0])
    end
  	mail(:to => @user.email, :subject => "New Photo album information")
    
  end

end