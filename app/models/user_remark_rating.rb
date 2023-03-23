class UserRemarkRating < ApplicationRecord
  belongs_to :user
  belongs_to :remark
end
