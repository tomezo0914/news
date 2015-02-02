class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.integer :user_id, null: false
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
