class RemoveColumnFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :razorpay_signature, :string
  end
end
