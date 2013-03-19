class AddUrlToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :url, :string
  end
end
