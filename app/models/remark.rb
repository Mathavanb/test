class Remark < ApplicationRecord
  belongs_to :product

  has_many :user_remark_ratings
  has_many :users, through: :user_remark_ratings
end
