class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  after_save :reduced_quantity

  def total_price
    if valid_quantity_and_price?
      quantity.to_s.to_d * product.price.to_s.to_d
    else
      0.0
    end
  end
  
  def valid_quantity_and_price?
    !quantity.to_s.strip.empty? && !product.price.to_s.strip.empty?
  end

  private

  def reduced_quantity
    product = Product.find_by_id(self.product_id)
    quantity = product.quantity - self.quantity.to_i
    product.update(quantity: quantity) if product.quantity > 0
  end

end
