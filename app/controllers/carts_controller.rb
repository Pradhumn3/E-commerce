class CartsController < ApplicationController
  def show
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart.line_items.destroy_all
    redirect_to root_path
  end

  def checkout
    @order = RazorpayServices.create_order(params[:amount].to_i * 100) 
  end

  def carts_verify_payment
    payment_response ={
      razorpay_order_id: params[:razorpay_order_id], 
      razorpay_payment_id: params[:razorpay_payment_id], 
      razorpay_signature: params[:razorpay_signature]
      }
    confirm = RazorpayServices.verify_payment_status(payment_response)
    if confirm
      create_order(payment_response)
      empty_cart
      flash[:notice] = " Order successfully created."
      redirect_to root_path
    else
      flash[:notice] = "Error created."
      redirect_to root_path
    end
  end

  private

  def create_order(payment_response)
    @order = current_user.orders.new(payment_response)
    if @order.save!
      @current_cart.line_items.each do |line_item|
        @order.order_items.create!(         
          product_id: line_item.product_id,
          quantity:   line_item.quantity 
        )
      end
    end 
    OrderMailer.user_order(current_user, @order).deliver
  end

  def empty_cart
    @current_cart.line_items.destroy_all
  end
  
  def cart_params
    params.require(:cart).permit(:user_id)
  end
end
