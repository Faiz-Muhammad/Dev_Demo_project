class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  # before_action :require_same_user, except: [:show, :index]

  def index
    @products = current_user.products.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      flash[:success]= "Your Product has been created successfully!"
      redirect_to user_products_path
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    if @product.update(product_params)
      flash[:success]="Your has been updated successfully!"
      redirect_to user_product_path(current_user, @product)
    else
      render 'edit'
    end
  end

  def show
    @comment = Comment.new
    @comments = @product.comments.all
  end

  def destroy
    @product.destroy
    flash[:success]= "Product has been deleted succesfully!"
    redirect_to user_products_path
  end

  private
  def product_params
    params.require(:product).permit(:p_name, :p_price, :p_description, :user_id, images: [])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  # def require_same_user
  #   if (current_user.id != params[:user_id].to_i)
  #     flash[:danger] = "Only admin user can perform this action."
  #     redirect_to root_path
  #   end
  # end

end
