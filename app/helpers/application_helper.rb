module ApplicationHelper

	def admin?
		current_user.client_id == 0 ? true : false
	end

end
