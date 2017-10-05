require 'test_helper'

class CorpsControllerTest < Rff::IntegrationTest 
 

  def setup
    log_user('admin','password')
  end

  test "get add a new corp " do
    get new_corp_url
    assert_response :success
  end

  test "post a new corp" do
    assert_difference('Corp.count') do 
      post corps_url, params: {
          corp: {
            name: "dhsp"
          }
        }
    end
    assert_redirected_to corps_url
  end

end
