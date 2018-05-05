module TasksHelper
  def get_priority_pill priority
    case priority
    when 3..5
      res = "badge-primary"
    when 6..8
      res = "badge-warning"
    when 9..10
      res = "badge-danger"
    end

    "<span class=\"badge #{res} badge-pill\">#{priority}</span>".html_safe
  end

  def get_task_children_stack
    Task.where(parent_id: @task.id).first 3
  end
end
