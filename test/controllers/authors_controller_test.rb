require 'test_helper'

class AuthorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "index action should assign all authors" do
    # Given
    authors = 5.times.map{ given_an_author_exists }

    # When
    get :index

    # Then
    assert_response :success
    assert_equal authors, assigns( :authors )
  end

  test "index action should have #foo_link element for js" do
    # Given
    # When
    get :index

    # Then
    assert_response :success
    assert_select "a[id=foo_link]"
  end

  test "show action should assign author by id" do
    # Given
    authors = 5.times.map{ given_an_author_exists }
    author = authors[3]

    # When
    get :show, :id => author.id

    # Then
    assert_response :success
    assert_equal author, assigns( :author )
  end

  test "names action renders json" do
    # Given
    names = [ "one", "two", "three" ]
    authors = names.each { |name| given_an_author_exists( :name => name ) }

    # When
    get :names, :format => :json

    # Then
    assert_response :success
    assert_equal( names, JSON.parse( response.body ) )
  end
end
