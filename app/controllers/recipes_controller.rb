class RecipesController < ApplicationController
    def index
        recipes = Recipe.all
        render json: recipes.to_json(include: {ingredients:{only: [:id,:title,:quantity]}})
    end

    def show 
        recipe = Recipe.find_by(id: params[:id])
        
        render json: recipe.to_json(include: {ingredients:{only: [:id,:title,:quantity]}})
    end

    def create
       recipe = Recipe.new(createRecipeParams)   
       recipe.save
  
       array =params[:ingredients].map {|ingredient| Ingredient.new(recipe_id:recipe.id,quantity: ingredient['quantity'],title: ingredient['ingredient'] ).save}

       
      if array.all?(true)
        render json: recipe.to_json
       else 
        render json: {error: "Could not create"}
    end
    
   end 
    
      def createRecipeParams 
        params.permit( :title, :method)
    end
      
end
