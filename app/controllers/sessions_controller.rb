class SessionsController < ApplicationController
    def create
        user = User.find_by(username: params.dig(:formData, :username))
        if user.nil?
            render json: { errors: { username: "Username not found" } }, status: :unauthorized
        elsif user.authenticate(params.dig(:formData, :password))
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: { password: "Password is invalid" } }, status: :unauthorized
        end
    end

    def destroy
        session.delete :user_id
        head :no_content
    end
end
