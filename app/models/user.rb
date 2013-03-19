class User < ActiveRecord::Base
  attr_accessible :email, :name, :password

  has_many :phrases, dependent: :destroy
  
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  has_secure_password

  validates :password, :presence => true
  validates_uniqueness_of :email, :name

  def feed
  end

  def following?(other_user)
  	self.relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
  	self.relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
  	self.relationships.find_by_followed_id(other_user.id).destroy
  end
end
