class UsersController < ApplicationController
  skip_before_action :authorized

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: @user, jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  # def profile
  #   @user = User.find(params[:id])
  #   render json: { user: current_user }, status: :accepted
  #   # render json: { user: UserSerializer.new(current_user) }, status: :accepted
  # end

  # def show
  #   @user = User.find_by(username: user_login_params[:username])
  #   render json: { user: @user, jwt: @token }
  # end
  # def create
  #   @user = User.create(user_params)
  #   if @user.valid?
  #     render json: { user: @user }, status: :created
  #   else
  #     render json: { error: 'failed to create user' }, status: :not_acceptable
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
