class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :post_title
      t.text :post_body

      t.timestamps
    end
  end
end
