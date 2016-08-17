require_relative "../test_helper"

class UserCanCreateANewTaskTest < FeatureTest
  def test_user_can_create_a_new_task_test
    visit '/'
    click_link("New Task")

    assert page.has_content?("Enter a new task:")
  end
end
