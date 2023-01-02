class CreateUserSubcriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_subcriptions do |t|
      t.string :subscription_id
      t.bigint :user_id
      t.timestamps
    end
  end
end
