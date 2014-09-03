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

  test "can't create user with same email address" do
    params1 = {
      name: "Mr Tester",
      email: "foo@bar.com",
      password: "changeme",
      salt: "123456"
    }

    params2 = {
      name: "Ms Peters",
      email: "foo@bar.com",
      password: "p4ssw0rd",
      salt: "abcdef"
    }

    assert User.create! params1
    assert_raises( ActiveRecord::RecordInvalid ) do
      User.create! params2
    end

  end
    
end
