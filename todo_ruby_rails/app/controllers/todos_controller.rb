class TodosController < ApplicationController

    def index
    end

    def create
      @todo = Todo.new(todo_params)
      @todo.user_id = params[:user_id]
      @todo.list_id = params[:list_id]
      @todo.save
      redirect_to user_list_path(params[:user_id], params[:list_id])
    end

    def todo_params
      params.require(:todo).permit(:content)
    end




end
