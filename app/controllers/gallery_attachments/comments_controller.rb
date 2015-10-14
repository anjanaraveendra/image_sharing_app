class GalleryAttachments::CommentsController < CommentsController
	before_action :set_commentable

	private

	def set_commentable
		@commentable = GalleryAttachments.find(params[:gallery_attachment_id])
	end

end