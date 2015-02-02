class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
