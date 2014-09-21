class Publishing < ActiveRecord::Base
  belongs_to :book
  belongs_to :author

  validates_presence_of :publication_date
end
