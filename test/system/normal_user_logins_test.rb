require 'application_system_test_case'

class NormalUserLoginsTest < ApplicationSystemTestCase

  def setup
    logout
  end

  test "user with valid attribute" do
    loginBy('opera', 'password')
    assert_text "welcome opera"
  end

end
