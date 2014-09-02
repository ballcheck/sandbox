require 'test_helper'

class AuthorTest < ActiveSupport::TestCase

  test "can create an author" do
    # Given
    name = "Roger Phillips"

    # When / Then
    assert_difference( "Author.count", 1 ) do
      assert author = Author.create!( { :name => name } );
    end
  end

  #test "an author has many books" do
  #  # Given
  #  author = given_an_author_exists
  #  book = given_a_book_exists

  #  # When
  #  author.books << book

  #  # Then
  #  assert_equal [ book ], author.books
  #end

  # or with shoulda gem
  should have_many :books

  # might be still worth doing
  test "can add book to author.books" do
    # Given
    author = given_an_author_exists
    book = given_a_book_exists

    # When
    author.books << book

    # Then
    assert_equal [ book ], author.books
  end

  #test "an author without a name cannot be saved" do
  #  # Given
  #  name = nil

  #  # When # Then
  #  assert_raises( ActiveRecord::RecordInvalid ) do
  #    Author.create!( { :name => name } )
  #  end
  #end

  ## another way of looking at it
  #test "an author without a name is not valid" do
  #  # Given
  #  name = nil

  #  # When
  #  author = Author.new( { :name => name } )

  #  # Then
  #  refute author.valid?
  #end
    
  # or with shoulda gem
  should validate_presence_of :name


end
