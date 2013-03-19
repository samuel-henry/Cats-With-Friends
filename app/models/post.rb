class Post < ActiveRecord::Base
  attr_accessible :content, :user_id, :url
  belongs_to :user
  validates :content, :presence => true
  validates :url, :presence => true
end
