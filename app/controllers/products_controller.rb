class ProductsController < ApplicationController
  def index
    @products = if params[:category].present?
                  Product.where(category_id: params[:category][:id]).paginate(:page => params[:page], :per_page => 8) 
                else
                  Product.paginate(:page => params[:page], :per_page => 8)
                end
  end

  def show
    @product = Product.find(params[:id])
  end
end
