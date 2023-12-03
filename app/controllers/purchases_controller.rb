class PurchasesController < ApplicationController
  before_action :authenticate_user!, :set_category

  def index
    @purchases = @category.purchases.order(created_at: :desc)
  end

  def show
    # Your logic here
  end

  def new
    @purchase = @category.purchases.build
  end

  def create
    @purchase = Purchase.new(transaction_params)
    @purchase.author = current_user
    puts "Attempting to save category: #{transaction_params}"
    # @purchase.category = @category

    respond_to do |format|
      if @purchase.save
        puts 'Category saved successfully'
        format.html { redirect_to category_purchases_path(@purchase.category_id), notice: 'Purchase was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        puts 'Category save failed'
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    # Your logic here
  end

  def update
    if @purchase.update(transaction_params)
      redirect_to category_transactions_path(@purchase), notice: 'Purchase was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @purchase.destroy
    redirect_to category_transactions_path, notice: 'Purchase was successfully destroyed.'
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
    @user = current_user
  end

  def transaction_params
    params.require(:purchase).permit(:name, :amount, :category_id)
  end
end
