require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all


end

module Rff
  class IntegrationTest < ActionDispatch::IntegrationTest
    def log_user(name,password)
      get login_url
      assert_nil session[:user_id]
      assert_response :success
      post login_url, params: { name: name, password: password }
    end
  end
end
