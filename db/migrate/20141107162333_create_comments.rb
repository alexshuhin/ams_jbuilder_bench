class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :post_id, index: true
      t.integer :author_id, index: true

      t.timestamps
    end
  end
end
