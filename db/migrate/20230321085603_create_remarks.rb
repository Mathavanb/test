class CreateRemarks < ActiveRecord::Migration[6.1]
  def change
    create_table :remarks do |t|
      t.text :body
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
