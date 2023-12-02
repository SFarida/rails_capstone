class TransactionsController < ApplicationController
  before_action :authenticate_user!, :set_category

  def index
    @transactions = Transaction.all
  end

  def show
    # Your logic here
  end

  def new
    # @transaction = Transaction.new

    @transaction = @category.transactions.build

    # @category = Category.find(params[:category_id])
    # @transaction = @category.transactions.build
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.author = current_user
    @transaction.category = @category

    puts "Attempting to save category: #{transaction_params}"
    respond_to do |format|
      if @transaction.save
        puts "Category saved successfully"
        format.html { redirect_to category_transactions_path, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        puts "Category save failed"
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    # Your logic here
  end

  def update
    if @transaction.update(transaction_params)
      redirect_to category_transactions_path(@transaction), notice: 'Transaction was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @transaction.destroy
    redirect_to category_transactions_path, notice: 'Transaction was successfully destroyed.'
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :category_id)
  end
end
