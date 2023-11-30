class CategoriesController < ApplicationController
    before_action :authenticate_user!

    def index
        @categories = Category.where(user: current_user)
    end

    def show
        @category = Category.includes(:transactions).find(params[:id])
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        @category.user = current_user
    
        # respond_to do |format|
        #   if @category.save
        #     format.html { redirect_to recipe_url(@recipe), notice: 'Category was successfully created.' }
        #     format.json { render :show, status: :created, location: @recipe }
        #   else
        #     format.html { render :new, status: :unprocessable_entity }
        #     format.json { render json: @recipe.errors, status: :unprocessable_entity }
        #   end
        # end
    end

    def recipe_params
        params.require(:recipe).permit(:name, :icon)
    end
end
