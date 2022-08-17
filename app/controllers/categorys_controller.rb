class CategorysController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    if user_signed_in?
      @category = Category.all
      @total_category_transactions = Category.includes(:transactions).where(user_id: current_user.id).sum(:amount)
      @transactions = Category.includes(:transactions).where(id: :category_id).sum(:amount)
    else
      render '/splash/welcome'
    end
  end

  def show
    @category = Category.find(params[:id])
    @transactions = Transaction.where(category_id: params[:id])
    @total_transactions = @transactions.sum(:amount)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    @category.user = current_user

    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
