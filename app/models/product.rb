class Product < ApplicationRecord
  belongs_to :category
  has_many :variants, dependent: :destroy

  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags, reject_if: :all_blank

  has_many :ratings, dependent: :destroy

  has_one_attached :image
end
