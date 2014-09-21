require 'test_helper'

class BookTest < ActiveSupport::TestCase
  
  test "can create a book" do
    # Given
    title = "This side of paradise"
    author = given_an_author_exists

    args = { :title => title, :author => author }

    # Then
    assert_difference( "Book.count", 1 ) do
      assert Book.create!( args )
    end
  end

  #test "books can have an author" do
  #  # Given
  #  book = given_a_book_exists
  #  author = given_an_author_exists

  #  # When
  #  assert book.update_attributes!( :author => author )

  #  # Then
  #  assert_equal author, book.author
  #end

  # or with shoulda gem
  should belong_to :author

  #test "books without an an author are invalid" do
  #  # Given
  #  book = given_a_book_exists

  #  # When
  #  book.author = nil

  #  # Then
  #  refute book.valid?
  #end

  # or with shoulda gem
  should validate_presence_of :author

  #-----------
  # publishing
  #-----------

  #should have_many :publications

  test "method published?" do
    # Given
    book = given_a_book_exists

    # When
    book.stubs( :publishings ).returns( [] )

    # Then
    refute book.published?

    # When
    book.stubs( :publishings ).returns( [ mock ] )

    # Then
    assert book.published?
  end

  #test "can publish a book" do
  #  # Given
  #  book = given_a_book_exists
  #  refute book.published?

  #  # When
  #  book.publish

  #  # Then
  #  assert book.published?
  #end
  

end
