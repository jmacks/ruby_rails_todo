class UsersController < ApplicationController

  before_action :authorize, except: [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @list = List.new
    @list.user_id = @list.id
    @todo = Todo.new
    @todo.user_id = @todo.id
  end

  def new
    @user = User.new
  end

  def create
    puts "I am creating a user"
    puts user_params
    user = User.new(user_params)
    if user.save!
      puts "saved"
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      puts "failure"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(
    :username,
    :password,
    :password_confirmation
    )
  end




end
