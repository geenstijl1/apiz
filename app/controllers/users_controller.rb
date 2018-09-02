class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def login

    @user = User.find_by_email(params[:email])
    @username = User.find_by_name(params[:name])

    success = { message: 'Success' }
    email_incorrect = { message: 'Email or Username are Incorrects'}

    if @user and @username
      render json: success 
    else
      render json: email_incorrect 
    end

  end

  def register
    @user = User.create user_params
    if @user.save
      response = { message: 'User created successfully'}
      render json: response, status: :created
    else
      responseBad = { message: 'Email repetido' }
      render json: responseBad
    end
  end

  def aunthetication
  end

  def destroy
      @user = User.find(params[:id])
      @user.destroy
  end

  private
    def user_params
      params.permit(:name, :email, :password)
    end
end
