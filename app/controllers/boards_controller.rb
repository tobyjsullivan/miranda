class BoardsController < ApplicationController
  before_action :authenticate_user!

  def new
    @board = Board.new
  end

  def create
    board = Board.new(create_params)
    board.users<< current_user
    if board.valid?
      board.save
      redirect_to action: 'index'
    else
      @board = board
      render template: 'boards/new'
    end
  end

  def index
    @boards = current_user.boards
  end

  private

  def create_params
    params.require(:board).permit(:title, :slug)
  end
end
