class CartsController < ApplicationController
  def show
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart.line_items.destroy_all
    redirect_to root_path
  end

  private

  # Never trust parameters from the scary internet
  # , only allow the white list through.
  def cart_params
    params.require(:cart).permit(:user_id)
  end
end
