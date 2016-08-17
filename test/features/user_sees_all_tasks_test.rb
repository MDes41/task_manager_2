require_relative '../test_helper'

class UserSeesAllTasksTest < FeatureTest

  def test_verify_user_can_see_all_tasks
    task_manager.create({
                          title: "Title 1",
                          description: "Description1"
                        })
    task_manager.create({
                          title: "Title 2",
                          description: "Description2"
                        })
    visit '/tasks'

    save_and_open_page

    assert page.has_content?("1: Title 1")
    assert page.has_content?("2: Title 2")
  end

end
