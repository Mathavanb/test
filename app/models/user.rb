class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :products
  has_many :variants

  has_many :user_remark_ratings
  has_many :remarks, through: :user_remark_ratings

  has_and_belongs_to_many :products, join_table: "products_users"
end
