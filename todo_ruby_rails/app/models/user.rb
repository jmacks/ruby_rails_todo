class User < ActiveRecord::Base

  validates :username, presence: true,
                       length: { minimum: 5 }
  validates :password, presence: true

  has_secure_password

  has_many :lists
  has_many :todos
  
end
