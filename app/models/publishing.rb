class Publishing < ActiveRecord::Base
  belongs_to :book
  belongs_to :author

  validates :publication_date, presence: true
  validates_presence_of :book, :author
end
