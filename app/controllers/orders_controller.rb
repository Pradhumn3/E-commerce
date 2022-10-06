class OrdersController < ApplicationController

  def index
    @orders = current_user.orders.paginate(:page => params[:page], :per_page => 2)  
  end
end
