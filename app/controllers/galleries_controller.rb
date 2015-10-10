class GalleriesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  # GET /galleries
  # GET /galleries.json
  def index
    @galleries = Gallery.all
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @gallery_attachments = @gallery.gallery_attachments.all
  end

  # GET /galleries/new
  def new
    @gallery = Gallery.new
    @gallery_attachment = @gallery.gallery_attachments.build
  end

  # GET /galleries/1/edit
  def edit
  end

  # POST /galleries
  # POST /galleries.json
  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.user_id = current_user.id
    if params[:gallery_attachments]['avatar'].count < 26
      respond_to do |format|
        if @gallery.save
            params[:gallery_attachments]['avatar'].each do |a|
              @gallery_attachment = @gallery.gallery_attachments.create!(:avatar => a,:user_id => current_user.id)
            end
         
          format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
          format.json { render :show, status: :created, location: @gallery }
        else
          format.html { render :new }
          format.json { render json: @gallery.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:notice] = "You cannot upload more than 25 files"
      respond_to do |format|
        format.html { render :error }
      end
    end
  end

  # PATCH/PUT /galleries/1
  # PATCH/PUT /galleries/1.json
  def update
    if current_user.id == @gallery.user_id
      respond_to do |format|
        if @gallery.update(gallery_params)
          format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
          format.json { render :show, status: :ok, location: @gallery }
        else
          format.html { render :edit }
          format.json { render json: @gallery.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    if current_user.id == @gallery.user_id
      @gallery.destroy
      respond_to do |format|
        format.html { redirect_to galleries_url, notice: 'Gallery was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_params
      params.require(:gallery).permit(:title, :user_id ,gallery_attachments_attributes: [:id, :gallery_id, :avatar])
    end
end
