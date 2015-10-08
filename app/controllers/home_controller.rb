class HomeController < ApplicationController
	  before_filter :authenticate_user!

  def index
  	@galleries = Gallery.all.limit(25)
  end
end
