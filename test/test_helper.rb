require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def logout
    session[:user_id] = nil 
  end

end

module Rff
  class IntegrationTest < ActionDispatch::IntegrationTest
    def log_user(name,password)
      get login_url
      assert_response :success
      post login_url, params: { name: name, password: password }
    end

    def loginByAdmin
      log_user('admin','password')
    end

    def createNewUser(name,password)
      loginByAdmin 
      post users_url, params: {
          user: {
            name: name,
            password: password,
            password_confirmation: password
          }
      }
    end

    def createNewCorp(name)
      loginByAdmin 
      post corps_url, params: {
        corp: {
          name: name
        }
      }
      end
  end
end
