ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # We are going to put factories in here for brevity

  #-------------
  # AR factories
  #-------------

  def given_an_author_exists( args = {} )
    args[:name] = "Susan Palmer" unless args.has_key?( :name )
    assert author = Author.create!( args )
    return author
  end

  def given_a_book_exists( args = {} )
    args[:title] = "Smiles of a summer night" unless args.has_key?( :title )
    args[:author] = given_an_author_exists
    assert book = Book.create!( args )
    return book
  end

  #---------------
  # misc factories
  #---------------

  def given_a_random_string
    "...here we go round the mulberry bush!"
  end
end
