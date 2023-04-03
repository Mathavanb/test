class AddRatingsCountToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :ratings_count, :float
  end
end
