class Book < ActiveRecord::Base
  belongs_to :author

  validates_presence_of :author

  def published?
    publishings.any?
  end
end
