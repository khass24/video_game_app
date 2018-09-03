class Api::GamesController < ApplicationController
  def index
    @games = Game.all
    render 'index.json.jbuilder'
  end

  def create
    @game = Game.new(
                      title: params[:title],
                      rating: params[:rating],
                      creator: params[:creator],
                      price: params[:price]
                      )
    @game.save
    render 'show.json.jbuilder'
  end

  def show
    @game = Game.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @game = Game.find(params[:id])

    @game.title = params[:title] || @game.title
    @game.rating = params[:rating] || @game.rating
    @game.creator = params[:creator] || @game.creator
    @game.price = params[:price] || @game.price

    @game.save
    render 'show.json.jbuilder'
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    render json: {message: "Game successfully destroyed"}
  end
end
