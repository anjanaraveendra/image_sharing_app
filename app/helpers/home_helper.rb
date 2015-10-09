module HomeHelper

	def username id
		u = User.find(id)
		if u.first_name.present? && u.last_name.present?
			name = u.first_name + " " + u.last_name
			return name
		end
	end

end
