class Comment < ActiveRecord::Base
	  belongs_to :gallary_type, polymorphic: true
end
