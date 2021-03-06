class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
protect_from_forgery with: :exception
  include SessionsHelper

before_filter :configure_permitted_parameters, if: :devise_controller?
helper_method :mailbox, :conversation


private

def mailbox
  @mailbox ||= current_user.mailbox
end

def conversation
  @conversation ||= mailbox.conversations.find(params[:id])
end

protected

def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name,:last_name,:avatar, :email, :password) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:first_name,:last_name, :email, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name,:last_name, :avatar, :email, :password, :current_password) }
end 

end
