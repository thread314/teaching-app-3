class CardsController < ApplicationController
  def new
  end

  def show
    @card = Card.find(params[:id])
  end

  def edit
    @card = Card.find(params[:id])
  end

  def index
  end

	def destroy
    @card = Card.find(params[:id])
		@card.destroy	
		redirect_to users_path
	end
end
