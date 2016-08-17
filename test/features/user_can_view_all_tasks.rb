require_relative "../test_helper"

class UserCanViewAllTasks < FeatureTest
  def test_user_can_view_all_tasks
    visit '/'
    click_link('Task Index')

    assert page.has_content?("All Tasks")
  end
end
