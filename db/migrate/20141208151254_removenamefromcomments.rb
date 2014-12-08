class Removenamefromcomments < ActiveRecord::Migration
  def change
  	remove_column :comments, :name
  end
end
