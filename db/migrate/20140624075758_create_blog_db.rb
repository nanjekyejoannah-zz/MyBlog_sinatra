class CreateBlogDb < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
      t.string :title
      t.text :body
      t.timestamps
    end

    create_table :comments do |t|
      t.belongs_to :post
      t.text :body
      t.timestamps
    end
  end
end
