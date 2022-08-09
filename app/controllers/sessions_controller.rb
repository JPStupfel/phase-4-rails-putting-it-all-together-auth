class SessionsController < ApplicationController

    # make a post method to login

    def create
        user = User.find_by username: params[:username]
        if user &.authenticate params[:password]
            session[:user_id] = user.id
            render json: user, status: 201
        else
            render json: {errors: ['Invalid Login']}, status: 401
        end
    end

    def destroy
        if session[:user_id]
            session.delete :user_id
            render json: {}, status: 204
        else
            render json: {errors: ['log in first']}, status: 401
        end
    end

    # make a delete method to delete session data


end
