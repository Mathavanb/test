class CreateUserRemarkRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :user_remark_ratings do |t|
      t.integer :rate
      t.references :user, null: false, foreign_key: true
      t.references :remark, null: false, foreign_key: true

      t.timestamps
    end
  end
end
