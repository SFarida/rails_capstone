class CategoriesController < ApplicationController
    before_action :authenticate_user!

    def index
        @categories = Category.where(user: current_user)
        @categories.each do |cat|
            puts "cat name: #{cat.name}"
        end
    end

    def show
        @category = Category.includes(:transactions).find(params[:id])
        redirect_to category_transactions_path(@category)
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        @category.user = current_user
        puts "Attempting to save category: #{category_params}"
        respond_to do |format|
            if @category.save
                puts "Category saved successfully"
                format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
                format.json { render :show, status: :created, location: @category }
            else
                puts "Category save failed"
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @category.errors, status: :unprocessable_entity }
            end
        end
    end


    def category_params
        params.require(:category).permit(:name, :icon)
    end
end
