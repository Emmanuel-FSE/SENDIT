class ParcelsController < ApplicationController
    def index
        parcels = Parcel.all
        render json: parcels, status: :ok
    end

    def show
        parcel = Parcel.find(params[:id])
        render json: parcel, status: :ok
    end
    
    def create
        parcel = Parcel.create!(parcel_params)
        render json: parcel, status: :created
    end

    private

    def parcel_params
        params.permit(:user_id, :parcel_name, :pickup_location, :destination, :weight, :price)
    end
end
