class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.date :date

      t.timestamps
    end
  end
end
