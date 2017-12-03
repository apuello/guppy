class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.integer :user_id, null: false
      t.string :user_handle, null: false
      t.text :message, null: false
      t.float :sentiment, null: false
      t.integer :followers, null: false

      t.timestamps null: false
    end
  end
end
