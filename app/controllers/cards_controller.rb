class CardsController < ApplicationController
  def new
  end

  def show
    @card = Card.find(params[:id])
  end

  def edit
  end

  def index
  end

end
