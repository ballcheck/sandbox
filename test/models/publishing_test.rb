require 'test_helper'

class PublishingTest < ActiveSupport::TestCase
  test "can create publishing" do
    # Given
    book = given_a_book_exists
    author = given_an_author_exists
    
    # When # Then
    assert_difference( "Publishing.count", 1 ) do
      publishing = Publishing.create!( :book => book, :author => author )
    end
  end

  should belong_to :book
  should belong_to :author
end
