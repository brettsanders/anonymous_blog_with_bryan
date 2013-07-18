class CreatePostsAndTags < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end

    create_table :tags do |t|
      t.string :name, null: false

      t.timestamps
    end

  end
end
