require_relative "../test_helper"

class TaskMangagerLinkWorksOnAllPages < FeatureTest
  def test_task_manager_link_works_on_all_pages
    visit '/tasks'
    click_link('Task Manager')
    assert page.has_content?("Welcome to the Task Manager")

    visit '/tasks/new'
    click_link('Task Manager')
    assert page.has_content?("Welcome to the Task Manager")

    visit '/tasks/'

    click_link('Task Manager')
    assert page.has_content?("Welcome to the Task Manager")
  end



  end
end
