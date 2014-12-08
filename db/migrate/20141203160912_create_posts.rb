class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.timestamps
    	t.string :name
    	t.text :text
    	t.integer :user_id
    end
  end
end
