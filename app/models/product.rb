class Product < ApplicationRecord
  belongs_to :category
  has_many :variants

  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags, reject_if: :all_blank
end
