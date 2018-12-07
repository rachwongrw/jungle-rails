class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :product_id, index: true, foreign_key: true
      t.integer :user_id, index: true, foreign_key: true
      t.string :description
      t.integer :rating
      t.date :created_at
      t.date :updated_at

      t.timestamps null: false
    end
  end
end
