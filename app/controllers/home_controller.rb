class HomeController < ApplicationController
	#before_filter :authenticate_user!
	layout 'landing'
  def index
    if user_signed_in?
      redirect_to start_path
    end
  end
end
