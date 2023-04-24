class StatusesController < ApplicationController
    def index
        status = Status.all
        render json: status, status: :ok
    end

    def update
      status = Status.find(params[:id])
      if params[:location]
        if status.update(location: params[:location])
          render json: { message: 'Location updated successfully' }, status: :ok
        else
          render json: { error: 'Failed to update location' }, status: :unprocessable_entity
        end
      elsif params[:status]
        if status.update(status: params[:status])
          render json: { message: 'Status updated successfully' }, status: :ok
        else
          render json: { error: 'Failed to update status' }, status: :unprocessable_entity
        end
      end
    end
    
end
