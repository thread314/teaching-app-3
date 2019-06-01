class UsersController < ApplicationController
  
	def new
		@newuser = User.new
  end
	
	def create
		@newuser = User.create(user_params)
		redirect_to @newuser
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to @user
		end
	end

	def index
		@users = User.all
	end

  def show
    @user = User.find(params[:id])
		helpers.addnewcards(@user)
		@numberofduecards = helpers.getallduecards(@user).count
  end

  def study
		@user = User.find(params[:id])
		if @nextcard = helpers.getnextcard(@user)
      @questionarray = helpers.separatequestion(@nextcard.card.levels.first.question)
    end
  end

  def cardlist
		@user = User.find(params[:id])
  end

	private

	def user_params
		params.require(:user).permit(:name)
	end
end
