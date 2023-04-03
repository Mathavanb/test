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
  default_scope { }


  def self.product_date(from_date,to_date)
    if from_date.present? && to_date.present?
      where("created_at between ? and ?",from_date,to_date)
    elsif from_date.nil? && to_date.nil?
      earliest_date = self.order(:created_at).pluck(:created_at).first
      latest_date = self.order(created_at: :desc).pluck(:created_at).first
      where("created_at between ? and ?", earliest_date, latest_date)
    end
    end
end
