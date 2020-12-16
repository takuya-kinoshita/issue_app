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

  def update
    @board = Board.find(params[:id])
 @board.name = params[:name]
 @board.responsible = params[:responsible]
 @board.title = params[:title]
 @board.body = params[:body]
 @board.deadline = params[:deadline]

 if @board.update(board_params)
   flash[:notice] = "success editing"
   redirect_to boards_path
 else
   render "edit"
 end
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
