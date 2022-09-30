class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :house_no
      t.string :area
      t.string :land_mark
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
