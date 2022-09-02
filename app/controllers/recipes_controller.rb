class RecipesController < ApplicationController
  before_action :authorize
  
  def index 
    user = User.find_by(id: session[:user_id])
    # if user
      recipes = user.recipes
      render json: recipes, status: :created
    # else
    #   # byebug
    #      render json: { error: "Not authorized" }, status: :unauthorized
    #  end
  end
  
  def create
    user = User.find_by(id: session[:user_id])
    # if user
      recipe = user.recipes.create(recipe_params)
      if recipe.valid?
      render json: recipe, status: :created
      else
        render json: {errors: recipe.errors.full_messages}, status: :unprocessable_entity
      end
    # else
    #   render json: { error: "Not authorized" }, status: :unauthorized
    # end

  end
  private
    
  def recipe_params
    params.permit(:title, :instructions, :minutes_to_complete)
  end

  def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

end
