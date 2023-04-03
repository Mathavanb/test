class AddVariantsCountToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :variants_count, :integer
  end
end
