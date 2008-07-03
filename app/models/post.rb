class Post < ActiveRecord::Base
  acts_as_taggable
  has_many :comments, :as => :commentable

  validates_presence_of :title
  validates_presence_of :body
end
