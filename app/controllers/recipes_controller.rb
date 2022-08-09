class RecipesController < ApplicationController
    
    def create
        user = User.find_by id: session[:user_id]
       
        if user
            recipe = user.recipes.create(recipe_params)
            if recipe.valid?
                render json: recipe, status: 201
            else
                render json: {errors: ['error']}, status: 422
            end
        else
            render json: {errors: ['error']}, status: 401
        end
        


    end

    def index
        if session[:user_id]
            render json: Recipe.all, status: 201
        else
            render json: {errors: ['log in first']}, status: 401
        end
    end

    private
    def recipe_params
        params.permit :title, :minutes_to_complete, :instructions
    end
end
