class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
