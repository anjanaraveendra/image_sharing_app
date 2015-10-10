module ApplicationHelper

	def flash_class(level)
    case level.to_sym
      when :notice then "alert alert-success"
      when :info then "alert alert-info"
      when :alert then "alert alert-danger"
      when :warning then "alert alert-warning"
    end
  end

  def active_page(active_page)
    @active == active_page ? "active" : ""
  end
  

  def signed_in?
    !current_user.nil?
  end

  # def current_user=(user)
  #   @current_user = user
  # end

  # def current_user
  #   @current_user ||=User.find_by_remember_token(cookies[:remember_token])
  # end

  # def current_user?(user)
  #   user == current_user
  # end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end
  
end
