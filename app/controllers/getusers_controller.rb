class GetusersController < ApplicationController
  load_and_authorize_resource
  def show
  	@users = User.where("username like ?", "%#{params[:q]}%") 
   	respond_to do |format|
      	format.html
      	#format.json { render :json => @users.map(&:attributes)}
      	format.json do
		  render :json => @users.map { |user| {:id => user.id, :name => user.username} }
		end
     end
  end

  def get
  end
end
