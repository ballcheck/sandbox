class User < ActiveRecord::Base
  validates_presence_of :name, :email, :password, :salt
  validates :email, presence: true, uniqueness: true

end
