class Book < ActiveRecord::Base
  belongs_to :author

  has_many :publishings

  validates_presence_of :author

  def published?
    publishings.any?
  end

  def publish
    publishings.create( :author => author )
  end
end
