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

end
