class AddUpvotesToPost < ActiveRecord::Migration
  def change
    add_column :posts, :upvotes, :integer, :null => false, :default => 0
  end
end
