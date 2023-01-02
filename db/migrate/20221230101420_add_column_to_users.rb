class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :razorpay_customer_id, :string
  end
end
