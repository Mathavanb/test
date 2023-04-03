class ResetAllProductCacheCounters < ActiveRecord::Migration[6.1]
  def up

    Product.all.each do |product|

      Product.reset_counters(product.id, :variants)

    end

  end

  def down

    # no rollback needed

  end
end
