  class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
      start_index_path
  end
  rescue_from CanCan::AccessDenied do |exception|
    	# Hier wird konfigutiert wo nach der Exception (Von CanCan)
    	# hingesprungen wird.
      if user_signed_in?
        redirect_to start_index_path, :alert => exception.message 
    	else
    		redirect_to root_url, :alert => exception.message
    	end
	end
end
