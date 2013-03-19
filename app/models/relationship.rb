class Relationship < ActiveRecord::Base
  attr_accessible :followed_id, :follower_id

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true
  validates :followed_id, presence: true

  #following a user upvotes all their posts!
  after_save :upvote_new_friend

  before_destroy :downvote_old_friend

  private
  	def upvote_new_friend
  		followed.posts.each do |post|
  			post.upvotes +=1
  			post.save
  		end
  	end

  	def downvote_old_friend
  		followed.posts.each do |post|
  			post.upvotes -=1
  			post.save
  		end
  	end
end
