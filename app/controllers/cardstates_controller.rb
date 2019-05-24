class CardstatesController < ApplicationController

  def edit
		#Temporary hard coding this to the last user, fix this
		#@user = User.find(params[:id])
		@user = User.last
		@nextcard = helpers.getnextcard(@user)
		@questionarray = helpers.separatequestion(@nextcard.card.levels.first.question)
  end

	def update
		# @user = User.find(params[:id])
		@nextcard = Cardstate.find(params[:id]) 
		if @nextcard.update_attributes(cardstate_params)
			redirect_to User.last
		end
	end

	private

	def cardstate_params
		params.require(:cardstate).permit(:successes)
	end

end
