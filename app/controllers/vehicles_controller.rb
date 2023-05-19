class VehiclesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :vehicle_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

before_action :authorize
skip_before_action :authorize, only: [:index]

    def index
        vehicles = Vehicle.all
        render json: vehicles, status: :ok
    end

    def show
        vehicle = find_vehicle
        render json: vehicle, status: :ok
    end

    def update
        vehicle = find_vehicle
        vehicle.update!(vehicle_params)
        render json: vehicle, status: :accepted
    end

    def create
        vehicle = Vehicle.create!(vehicle_params)
        render json: vehicle, status: :created
    end

    def destroy
        vehicle = find_vehicle
        vehicle.destroy
        head :no_content

    end

    private

    def authorize
        return render json: {errors: ["Not authorized"]}, status: :unauthorized unless session.include? :admin_id
    end

    def find_vehicle
        Vehicle.find(params[:id])
    end

    def vehicle_params
        params.permit(:name, :price, :image, :transmission, :category, :drive, :mileage, :admin_id)
    end

    def vehicle_not_found_response
        render json: { error: 'Vehicle not found' }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
