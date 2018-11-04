# frozen_string_literal: true

require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
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
    get projects_url
    assert_response :success
  end

  test 'should get new' do
    get new_project_url
    assert_response :success
  end

  test 'should create project' do
    assert_difference('Project.count') do
      post projects_url, params: {
        project: {
          description: @project.description,
          goal: @project.goal,
          name: @project.name,
          creator_id: @project.creator.id,
          domain_id: @project.domain.id,
          project_type_id: @project.project_type.id
        }
      }
    end

    assert_redirected_to project_url(Project.last)
  end

  test 'should show project' do
    get project_url(@project)
    assert_response :success
  end

  test 'should get edit' do
    get edit_project_url(@project)
    assert_response :success
  end

  test 'should update project' do
    patch project_url(@project), params: {
      project: {
        description: @project.description,
        goal: @project.goal,
        name: @project.name
      }
    }
    assert_redirected_to project_url(@project)
  end

  test 'should destroy project' do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
