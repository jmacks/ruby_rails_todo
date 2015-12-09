class TodosController < ApplicationController

    def index
    end

    def create
      @todo = Todo.new(todo_params)
      @todo.user_id = params[:user_id]
      @todo.list_id = params[:list_id]
      @todo.save
    end

    def todo_params
      params.require(:todo).permit(:text)
    end




end
