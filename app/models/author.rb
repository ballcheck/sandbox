class Author < ActiveRecord::Base
  include FriendlyId

  has_many :books

  validates_presence_of :name
  
  friendly_id :name, :use => :slugged
end
