class CreateSubproducts < ActiveRecord::Migration[5.0]
  def change
    create_table :subproducts do |t|
      t.string :resolution

      t.timestamps
    end
  end
end
