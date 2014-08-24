require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "create user with normal values" do
    params = {
      name: "Mr Tester",
      email: "foo@bar.com",
      password: "changeme",
      salt: "123456"
    }

    assert User.create!( params );
  end
end
