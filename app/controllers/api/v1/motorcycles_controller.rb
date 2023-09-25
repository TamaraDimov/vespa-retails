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
    @motorcycle = Motorcycle.new(motorcycle_params.merge(user: current_user))

    if @motorcycle.save
      render json: { message: 'Created' }, status: :created
    else
      render json: { errors: @motorcycle.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @motorcycle = current_user.motorcycles.find_by(id: params[:id])

    if @motorcycle
      @motorcycle.destroy
      render json: { message: 'Motorcycle deleted successfully' }, status: :ok
    else
      render json: { message: 'Motorcycle not found' }, status: :not_found
    end
  end

  private

  def motorcycle_params
    params.require(:motorcycle).permit(:name, :model, :description, :photo, :make)
  end
end
