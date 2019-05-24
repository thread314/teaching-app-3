class CardstatesController < ApplicationController

  def edit
		@user = User.find(params[:id])
		@nextcard = helpers.getnextcard(@user)
		@questionarray = helpers.separatequestion(@nextcard.card.levels.first.question)
  end

	def update
		@nextcard = Cardstate.find(params[:id]) 
		@user = @nextcard.user
		if @nextcard.update_attributes(cardstate_params)
			redirect_to @user
		end
	end

	private

	def cardstate_params
		params.require(:cardstate).permit(:successes)
	end

end
