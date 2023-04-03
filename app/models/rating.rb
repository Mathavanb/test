class Rating < ApplicationRecord
  belongs_to :product
  after_save :update_rating

  def update_rating
    product.update(ratings_count:product.ratings.average(:value))
  end
end
