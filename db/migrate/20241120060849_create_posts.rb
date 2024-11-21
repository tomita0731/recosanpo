class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.integer :user_id
      t.integer :genre_id
      t.text :body
      t.string :place
      t.integer :step_count
      t.integer :publish_status
      t.timestamps
      
    end
  end
end
