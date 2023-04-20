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
        status = Status.create(parcel_id: parcel.id, location: parcel.pickup_location, status: "Pending")
        render json: parcel, status: :created
      end

        private

    def parcel_params
        params.require(:formData).permit(:user_id, :parcel_name, :pickup_location, :destination, :weight, :price, :description)
    end
end
