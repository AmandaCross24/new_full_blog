class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :post
      t.text :bio

      t.timestamps null: false
    end
  end
end
