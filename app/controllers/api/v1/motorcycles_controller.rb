class Api::V1::MotorcyclesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @motorcycle = @user.motorcycles.all
    return render json: @motorcycle if @motorcycle

    render json: { message: 'Resource not found' }, status: :not_found
  end

  def show
    @user = current_user
    @motorcycle = @user.motorcycles.find_by(id: params[:id])
    return render json: @motorcycle, status: :ok if @motorcycle

    return unless @motorcycle.nil?

    render json: { message: 'Resource not found' }, status: :not_found
  end

  def create
    data = params
    Motorcycle.create!(name: data['name'], model: data['model'], description: data['description'],
                       photo: data['photo'], user: current_user)
    render json: { message: 'Created' }, status: :created
  rescue StandardError
    render json: { message: 'The request parameters are invalid. Please check your input and try again.' },
           status: :unprocessable_entity
  end

  def destroy
    @motorcycle = current_user.motorcycles.find_by(id: params[:id])

    if @motorcycle
      @reservation = Reservation.where(motorcycle: @motorcycle)
      @reservation.destroy_all
      @motorcycle.destroy
      render json: { message: 'Motorcycle deleted successfully' }, status: :ok
    else
      render json: { message: 'Motorcycle not found' }, status: :not_found
    end
  end
end
