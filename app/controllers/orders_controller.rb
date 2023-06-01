class OrdersController < ApplicationController
  
  def index
    @orders = current_user.orders.order('created_at DESC').paginate(:page => params[:page], :per_page => 2)
    
  end

  def download_invoice
    @order = Order.find_by_id(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "order_invoice_#{@order.id}",
               template: "orders/download_invoice.html.erb",
               disposition: :inline,
              #  disposition: :attachment,
               layout: "pdf.html"
      end
    end
  end
end
