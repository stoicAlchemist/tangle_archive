# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
    @user = users(:user1)

    post login_path, params: {
      session: {
        email: @user.email,
        password: TEST_PASSWORD
      }
    }
  end

  def teardown
    delete logout_path
  end

  test 'should get index' do
    get tasks_url
    assert_response :success
  end

  test 'should get new' do
    get new_task_url
    assert_response :success
  end

  test 'should create task' do
    assert_difference('Task.count') do
      post tasks_url, params: {
        task: {
          title: @task.title,
          description: @task.description,
          priority: @task.priority,
          status_id: @task.status.id,
          effort_id: @task.effort.id,
          creator_id: @task.creator.id
        }
      }
    end

    # assert_redirected_to task_url(Task.last)
  end

  test 'should show task' do
    get task_url(@task)
    assert_response :success
  end

  test 'should get edit' do
    get edit_task_url(@task)
    assert_response :success
  end

  test 'should update task' do
    patch task_url(@task), params: {
      task: { description: @task.description, title: @task.title }
    }
    assert_redirected_to task_url(@task)
  end

  test 'should destroy task' do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end

  # Added tests

  # test "should not create task" do
  #   assert_no_difference('Task.count', 'Task should have a title') do
  #     post tasks_url, params: {
  #       task: { description: @task.description }
  #     }
  #   end

  # end
end
