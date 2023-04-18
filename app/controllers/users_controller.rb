class UsersController < ApplicationController
    def index
        users = User.all
        render json: users, status: :ok
    end

    def show
        user = User.find(params[:id])
        render json: user, status: :ok
    end
    
    def create
        user = User.create!(user_params)
        render json: user, status: :created
    end

    def update
        user = User.find(params[:id])
        user.assign_attributes(update_params)
        user.save(validate: false)
        render json: user, status: :ok
    end

    def logged_in
        user = User.find_by(id: session[:user_id])
        if user
        render json: user, status: :ok
        else
        render json: { error: "Not authorized" }, status: :unauthorized
        end
    end

    private

    def user_params
        params.require(:formData).permit(:username, :full_name, :email, :password, :user_type, :password_confirmation)
    end

    def update_params
        params.permit(:username, :email)
    end
end
