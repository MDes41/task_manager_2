require_relative "../test_helper"

class TaskManagerTest < Minitest::Test

  include TestHelpers

  def current_task_id
    task_manager.all.last.id
  end

  def test_it_creates_a_task
    task_manager.create({
      :title => "a title",
      :description => "a description"
      })
    task = task_manager.find(current_task_id)
    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal current_task_id, task.id
  end


end
