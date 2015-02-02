class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title, null: false
      t.text :content, null: false
      t.integer :author_id, null: false
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
