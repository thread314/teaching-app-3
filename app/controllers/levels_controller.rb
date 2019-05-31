class LevelsController < ApplicationController
  
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
