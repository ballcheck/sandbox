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
    Author.create!( args )
  end

  def given_a_book_exists( args = {} )
    args[:title] = given_a_random_string unless args.has_key?( :title )
    args[:author] = given_an_author_exists
    Book.create!( args )
  end

  def given_a_publishing_exists( args = {} )
    args[:book] = given_a_book_exists unless args.has_key?( :book )
    args[:author] = given_an_author_exists unless args.has_key?( :author )
    Publishing.create!( args )
  end

  #---------------
  # misc factories
  #---------------

  def given_a_random_string
    # TODO: if a test fails with a random value we should be able
    # to run the test again with the same value. This could possibly be achieved
    # with a seed value.
    SecureRandom.base64
  end
end
