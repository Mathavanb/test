class Product < ApplicationRecord
  validates :name, length: { maximum: 20 }, presence: true
  belongs_to :category
  has_many :variants, dependent: :destroy
  has_many :remarks, dependent: :destroy

  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags, reject_if: :all_blank

  belongs_to :user

  has_many :ratings, dependent: :destroy

  has_one_attached :image

  has_and_belongs_to_many :users, join_table: "products_users"
end
