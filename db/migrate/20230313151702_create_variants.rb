class CreateVariants < ActiveRecord::Migration[6.1]
  def change
    create_table :variants do |t|
      t.string :colour
      t.decimal :price
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
