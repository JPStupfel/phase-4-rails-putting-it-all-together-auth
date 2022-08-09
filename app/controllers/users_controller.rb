class UsersController < ApplicationController

    def create
        user = User.create user_params
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: 201
        else
            render json: {errors: user.errors.full_messages}, status: 422
        end
    end

    def show
        user = User.find_by id: session[:user_id]
        if user 
            render json: user, status: 201
        else
            render json: {errors: ["unauthorized"]}, status: 401
        end
    end

    private
    def user_params
        params.permit :password,:password_confirmation, :username, :image_url, :bio
        
    end
    
end
