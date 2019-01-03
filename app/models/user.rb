class User < ApplicationRecord
  has_many :projects
  validates :username, uniqueness: true
end
