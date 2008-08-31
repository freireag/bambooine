class Post < ActiveRecord::Base
  acts_as_taggable
  has_many :comments, :as => :commentable

  validates_presence_of :title
  validates_presence_of :body
  
  def self.search(search)
    if search
      find(:all, :conditions => ["title LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end
  
end
