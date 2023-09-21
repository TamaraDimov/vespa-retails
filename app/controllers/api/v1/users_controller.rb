class Api::V1::UsersController < ApplicationController

  def index
  end
  
  def create
    user = User.new(user_params)

    if user.save
      authenticate_users(user)
      render_authenticated_users(user)
    else
      render_error(user.errors)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

  def authenticate_users(user)
    token = AuthenticationTokenService.call(user.id) # Generate token
    response.headers['Authorization'] = "Bearer #{token}" # Set token in response header
  end

  def render_authenticated_users(user)
    render json: {
      user: { id: user.id, username: user.username, token: response.headers['Authorization'] },
      message: 'Authentication of user successful.'
    }, status: :created
  end

  def render_error(errors)
    render json: {
      error: errors.full_messages.join(' ')
    }, status: :unprocessable_entity
  end
end
