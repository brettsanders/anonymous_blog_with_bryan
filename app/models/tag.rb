class Tag < ActiveRecord::Base
  has_many :posts_tags
  has_many :post, :through => :posts_tags

  validates_presence_of :name
end
