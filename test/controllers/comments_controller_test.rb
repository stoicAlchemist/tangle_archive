require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # Setup all commentable
    @comment = comments(:one)
    @task    = tasks(:one)
    @domain  = domains(:one)
    @project = projects(:one)
  end

  test "should create a task comment" do
    assert_difference('Comment.count') do
      post task_comments_url(@task.id), params: {
        comment: {
          content: @comment.content,
          flagged: @comment.flagged,
          hidden:  @comment.hidden,
          creator_id: @comment.creator.id
        }
      }
    end

    assert_redirected_to task_url(@task)
  end

  test "should update task comment" do

    patch task_comment_url(@task, @comment), params: {
      comment: {
        content: @comment.content,
        flagged: @comment.flagged,
        hidden: @comment.hidden,
        commentable_id: @comment.commentable_id
      }
    }
    assert_redirected_to task_url(@task)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to comments_url
  end
end
