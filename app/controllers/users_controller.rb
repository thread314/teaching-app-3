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

  def study
		@user = User.find(params[:id])
		if @nextcard = helpers.getnextcard(@user)
      @questionarray = helpers.separatequestion(@nextcard.card.levels.first.question)
    end
  end

end
