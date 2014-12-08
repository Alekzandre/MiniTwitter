class RenameJewtIdtoPostId < ActiveRecord::Migration
  def change
  	rename_column :comments, :jewt_id, :post_id
  end
end
