class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
    @harmonics = product_hsn
  end

  def create
    @product = Product.new(product_params)
    if @product.save!
      redirect_to products_path
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to host_product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to client_products_path
  end


  private

  def product_params
    params.require(:product).permit(:type_id, :gst, :discount, :mrp, :unit, :harmonic_id, :description, :name)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def product_hsn
    hsns = []
    count = 1
    Harmonic.count.times do
      hsns << [Harmonic.find(count).id, Harmonic.find(count).hsn]
      count += 1
    end
    hsns
  end
end