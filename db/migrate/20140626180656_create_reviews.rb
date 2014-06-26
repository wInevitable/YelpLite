class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content, null: false
      t.integer :rating, null: false

      t.integer :author_id, null: false
      t.integer :business_id, null: false

      t.timestamps
    end

    add_index :reviews, [:author_id, :business_id]
  end
end
