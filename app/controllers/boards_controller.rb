class BoardsController < ApplicationController
  def index
    @boards = Board.paginate(page: params[:page])
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.create(board_params)
    if @board.save
      redirect_to boards_path
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end

  

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to boards_path
  end

  private

  def board_params
    params.require(:board).permit(:name, :title, :body, :responsible, :deadline)
  end


end
