require_relative "../test_helper"

class CreateANewTaskEditDeleteAndGoBack < FeatureTest

  def create_task
    visit '/tasks/new'
    fill_in('task[title]', :with => "Title1")
    fill_in('task[description]', :with => "Description1")
    click_button('submit')
  end


  def test_create_new_task_and_edit
    create_task

    visit '/tasks/1'
    assert page.has_content?("Title1")
  end

  def test_edit_new_task
    create_task
    visit '/tasks'
    click_link('Edit')
    fill_in('task[title]', :with => "New Title")
    fill_in('task[description]', :with => "New Description")
    click_button('submit')
    assert page.has_content?("New Title")
  end

  def test_delete_a_new_task
    create_task
    visit '/tasks/1'
    click_button('delete')
    assert page.has_content?('All Tasks')
    refute page.has_content?('Title1')
  end

end
