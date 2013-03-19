class RenamePhrasesToPosts < ActiveRecord::Migration
  def up
  	rename_table :phrases, :posts
  end

  def down
  	rename_table :posts, :phrases
  end
end
