class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :watch_count
      t.integer :author_id, index: true

      t.timestamps
    end
  end
end
