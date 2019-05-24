class CardstatesController < ApplicationController

  def edit
		@user = User.find(params[:id])
		@nextcard = helpers.getnextcard(@user)
		@questionarray = helpers.separatequestion(@nextcard.card.levels.first.question)
  end

end
