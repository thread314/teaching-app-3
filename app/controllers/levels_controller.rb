class LevelsController < ApplicationController
  
  def new
    @newlevel = Level.new
  end

  def create
    @user = User.last
    newcard = Card.create
    @newlevel = Level.new(level_params)
    @newlevel.update_attributes(card_id: newcard.id)
    @newlevel.save
    @user.cardstates.create(card_id: newcard.id, successes: -2)
    redirect_to @user
  end

  def edit
    @level = Level.find(params[:id]) 
  end

  def update
    @level = Level.find(params[:id]) 
    if @level.update_attributes(level_params)
      redirect_to @level.card
    end
  end

  private

  def level_params
    params.require(:level).permit(:question)
  end

end
