class HomeController < ApplicationController
	#before_filter :authenticate_user!
	layout 'landing'
  def index
  end
end
