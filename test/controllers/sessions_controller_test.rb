class SessionsControllerTest < ActionDispatch::IntegrationTest
    setup do
        @user = User.create!(email: 'test@example.com', password: 'password')
    end

    # test "should log in user with valid credentials" do
    #     post login_url, params: { session: { email: @user.email, password: 'password' } }
    #     assert_redirected_to courses_path
    #     assert_equal @user.id, session[:user_id]
    #     assert_equal 'Login successful!', flash[:notice]
    # end

    # test "should not log in user with invalid credentials" do
    #     post login_url, params: { session: { email: @user.email, password: 'wrong_password' } }
    #     assert_response :unprocessable_entity
    #     assert_nil session[:user_id]
    #     assert_equal 'Invalid email or password', flash[:alert]
    # end

    # test "should log out user" do
    #     # Log in first
    #     post login_url, params: { session: { email: @user.email, password: 'password' } }
    #     assert_equal @user.id, session[:user_id]
      
    #     # Log out
    #     delete logout_url
    #     assert_nil session[:user_id]
    #     assert_redirected_to login_path
    #     assert_equal 'Logged out successfully!', flash[:notice]
    # end

    # test "should redirect logged-in user trying to access login page" do
    #     post login_url, params: { session: { email: @user.email, password: 'password' } }
    #     get login_url
    #     assert_redirected_to courses_path
    # end

    # test "should redirect guest trying to access protected page" do
    #     get courses_url
    #     assert_redirected_to login_path
    #     assert_equal 'You must be logged in to access this page', flash[:alert]
    # end

end
  