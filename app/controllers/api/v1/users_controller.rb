class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      render_user(user)
    else
      render_error_response(user.errors)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

  def render_user(user)
    render json: {
      user: { id: user.id, username: user.username },
      message: 'User successfully created.'
    }, status: :created
  end

  def render_error_response(errors)
    render json: {
      error: errors.full_messages.join(' ')
    }, status: :unprocessable_entity
  end
end
