class CreateTermRelationships < ActiveRecord::Migration
  def change
    create_table :term_relationships do |t|
      t.integer :post_id, null: false
      t.integer :term_taxonomy_id, null: false
      t.integer :term_order, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
