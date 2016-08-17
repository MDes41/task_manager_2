require_relative '../test_helper'

class UserCanFillInATaskAndSubmitTest < FeatureTest
  def test_user_can_fill_in_a_task_and_submit
    visit "/tasks/new"
    fill_in('task[title]', :with => "Matt")
  end

  def test_user_can_create_a_new_task_test
    visit "/tasks/new"
    fill_in('task[title]', :with => "Matttest")
    fill_in('task[description]', :with => "descriptiontesting")

    click_button("submit")

    assert page.has_content?('Matttest')

    click_link('Matttest')
    assert page.has_content?('descriptiontesting')
  end
end
