class UsersController < ApplicationController
  
	def new
  end
	
	def index
		@users = User.all
	end

  def show
    @user = User.find(params[:id])
		helpers.addnewcards(@user)
  end

end
