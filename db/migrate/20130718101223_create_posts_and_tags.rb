class CreatePostsAndTags < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    end

    create_table :tags do |t|
    end

    create_table :posts_tags do |t|
    end
    
  end
end
