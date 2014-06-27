class CreatePostsAndCommentsTavles < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
      t.string :title
      t.string :body
      t.timestamps
    end
 
    create_table :comments do |t|
      t.belongs_to :post
      t.string :body
      t.timestamps
    end
  end
end
