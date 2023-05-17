# frozen_string_literal: true

class BoardsController < ApplicationController
  def index
    @new_board = BoardForm.new
    @last_ten_boards = Board.order(:created_at).limit(10)
  end

  def all
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def create
    board = BoardForm.new(board_params)
    if board.save
      flash[:success] = 'New board created successfully.'
    else
      flash[:error] = board.errors.full_messages
    end
    redirect_to root_path
  end

  private

  def board_params
    params.require(:board).permit(:name, :email, :width, :height, :mines)
  end
end
