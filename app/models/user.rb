class User < ActiveRecord::Base
  has_secure_password

  has_many :comments

  #posts created by the user
  has_many :posts

  #votes ABOUT this user
  has_many :votes, as: :votable

  #votes cast by the user
  has_many :ratings, class_name: 'Vote'

  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false}


  validates :password,
  presence: true,
  :on => :create

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end
end
