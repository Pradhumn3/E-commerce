class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :razorpay_order_id
      t.string :razorpay_payment_id
      t.string :razorpay_signature
      t.references :user

      t.timestamps
    end
  end
end
