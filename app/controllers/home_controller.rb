class HomeController < ApplicationController
	  before_filter :authenticate_user!

  def index
  	@galleries = Gallery.all.limit(25)
  end

  def user_gallery
  	@galleries = Gallery.where('user_id = ?',current_user.id)
  end

  def user_image
  	@images = GalleryAttachment.where('user_id = ?',current_user.id)
  end

end
