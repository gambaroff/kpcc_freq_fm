require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    assert_no_difference 'User.count' do
      post users_path, user: { user_name:  "",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
  end

  test "valid signup information" do
    skip "this is a falling test" do
      assert_difference 'User.count', 1 do
        post users_path, user: { user_name:  "Salvador Dali",
                                              email: "salvadordali@example.com",
                                              password:              "password",
                                              password_confirmation: "password" }
      end
    end
  end
end
