class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :content
      t.timestamps null: false
    end
    add_column :topics, :user_id, :integer
  end
end
