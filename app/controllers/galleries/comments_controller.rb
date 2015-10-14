class Galleries::CommentsController < CommentsController
	before_action :set_commentable

	private

	def set_commentable
		@commentable = Gallery.find(params[:gallery_id])
	end

end