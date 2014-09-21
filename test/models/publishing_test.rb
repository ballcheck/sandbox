require 'test_helper'

class PublishingTest < ActiveSupport::TestCase
  test "can create publishing" do
    # Given
    book = given_a_book_exists
    author = given_an_author_exists
    publication_date = given_a_random_date
    
    # When # Then
    assert_difference( "Publishing.count", 1 ) do
      publishing = Publishing.create!( :book => book, :author => author, :publication_date => publication_date )
    end
  end

  should belong_to :book
  should belong_to :author
  should validate_presence_of :publication_date
end
