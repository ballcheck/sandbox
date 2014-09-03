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

end
