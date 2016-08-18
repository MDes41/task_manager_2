require_relative "../test_helper"

class TaskManagerTest < Minitest::Test

  include TestHelpers

  def create_task
    task_manager.create({
      :title => "a title",
      :description => "a description"
      })
  end

  def current_task_id
     task_manager.all.last.id
  end

  def total_tasks
    task_manager.all.count
  end

  def test_it_creates_a_task
    assert_equal 0, total_tasks
    create_task
    assert_equal 1, total_tasks
    task = task_manager.find(current_task_id)
    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal current_task_id, task.id
  end

  def test_finds_a_task
    create_task
    assert_instance_of Task, task_manager.find(current_task_id)
  end

  def test_it_deletes_a_task
    create_task
    assert_equal 1, total_tasks
    task_manager.destroy(current_task_id)
    assert_equal 0, total_tasks
  end

  def test_update_method_updates_a_current_task
    # skip
    create_task
    task_data = { title: "new title", description: "new description" }
    task_manager.update(current_task_id, task_data)
    assert_equal 'new title', task_manager.find(current_task_id).title
  end
end
