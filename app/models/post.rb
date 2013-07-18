class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags

  validates_presence_of :title, :body

  after_destroy :delete_tags_with_no_posts

  def delete_tags_with_no_posts
    all_tags = Tag.all 

    all_tags.each do |tag|
      tag.destroy if tag.posts.empty?
    end

  end
end
