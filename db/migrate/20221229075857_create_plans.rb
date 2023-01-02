class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :plan_name
      t.string :description
      t.string :period
      t.string :billing_cycle
      t.string :amount
      t.string :razorpay_plan_id
      t.timestamps
    end
  end
end
