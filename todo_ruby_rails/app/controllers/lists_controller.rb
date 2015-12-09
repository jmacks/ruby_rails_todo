class ListsController < ApplicationController

  def index
    @lists = List.all
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @list = List.new
  end

  def create
    @user = User.find(params[:user_id])
    @list = List.new(list_params)
    @list.user_id = params[:user_id]
    @list.save


  end

  def show
    @list = List.find(params[:id])
    @todo = Todo.new
    @todo.list_id = @todo.id
  end

  def list_params
    params.require(:list).permit(:text)
  end


end
