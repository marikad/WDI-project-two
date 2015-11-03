class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
	
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

   protected
     # my custom fields are :username, :image
     def configure_permitted_parameters
       devise_parameter_sanitizer.for(:sign_up) do |u|
         u.permit(:username, :first_name, :last_name, :image, :email, :password, :password_confirmation)
       end

       devise_parameter_sanitizer.for(:account_update) do |u|
         u.permit(:username, :first_name, :last_name, :image, :email, :password, :password_confirmation, :current_password)
       end
     end
  
  rescue_from CanCan::AccessDenied do |exception|
  	flash[:error] = "You need to be signed in to access this page."
  	redirect_to root_url
  end


end
