require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @main_title = "Head Up"
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", "Home | #{@main_title}"
  end

  test "should get home page" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | #{@main_title}"
  end

  test "should get contact page" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "Contact | #{@main_title}"
  end

  test "should get about page" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@main_title}"
end

end
