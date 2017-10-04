require 'test_helper'

class UsersControllerTest < Rff::IntegrationTest
 
  test "admin can show all users" do
    log_user('admin','password')
    get users_url
    assert_response :success
  end

  test "admin not login can now show all user page" do
    get users_url
    assert_response :redirect
  end

  test "admin can show admin attribute" do
    log_user('admin','password')
    get users_url
    get "/users/1"
    assert_response :success 
  end

  test "admin can edit a user" do
    @user = User.first 
    log_user('admin', 'password')
    get users_url
    assert_select 'a', text: 'edit'
    get edit_user_url(@user)
    assert_response :success
    assert_select 'form'
    patch user_url(@user), params: 
        { user: 
          { name: @user.name ,
            password: @user.password }
        }
    assert_redirected_to user_url(@user)
  end  

  test "admin add a new user" do
    log_user('admin','password')
    assert_difference('User.count') do
      post users_url, params: {
          user: {
            name: 'jam',
            password: 'password',
            password_confirmation: 'password'
          }
      }
    end
    assert_redirected_to users_url
    
  end

end
