class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:success_subscriptions]
  def index
    @plans = Plan.all
    @products = if params[:category_id].present?
                  Product.where(category_id: params[:category_id]).paginate(:page => params[:page], :per_page => 8) 
                else
                  Product.paginate(:page => params[:page], :per_page => 8)
                end
  end

  def show
    @product = Product.find(params[:id])
  end

  def subscriptions
    @plan = Plan.find(params[:id])
    @response = RazorpayServices::create_subscription(@plan, current_user)
    @sub_id = @response.as_json["attributes"]["id"]
    crate_user_subcription if @sub_id.present? 
    redirect_to @response.short_url
  end
  
  def crate_user_subcription
    UserSubcription.create(user_id: current_user.id, subscription_id: @sub_id)
  end
end
