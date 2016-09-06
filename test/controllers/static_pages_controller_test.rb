require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @main_title = "Head Up"
  end

  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", "#{@main_title}"
  end

end
