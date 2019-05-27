class CardstatesController < ApplicationController

  def edit
		@user = User.find(params[:id])
		@nextcard = helpers.getnextcard(@user)
		@questionarray = helpers.separatequestion(@nextcard.card.levels.first.question)
  end

	def update
		@nextcard = Cardstate.find(params[:id]) 
		@user = @nextcard.user
    if cardstate_params[:first] == helpers.separatequestion(@nextcard.card.levels.first.question)["answer"]
      @nextcard.update(successes: @nextcard.successes += 1, lastsuccess: Date.today)
      flash[:message] = 'Correct'
    else
      @nextcard.update(successes: 0, lastsuccess: nil)
      flash[:message] = 'Incorrect'
    end
			redirect_to study_path(@user)
	end

	private

	def cardstate_params
		params.require(:answer).permit(:first)
	end

end
