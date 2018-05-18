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

  def new_task_modal opts = {}
    @task = Task.new
    modal = <<-HTML
      <div class="modal fade" id="newTaskModal" tabindex="-1" role="dialog"
        aria-labelledby="newTask" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="newTask">Add a task</h5>
              <button type="button" class="close" data-dismiss="modal"
                aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
            #{render 'tasks/form', project: opts[:project], task: @task}
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">
                Close
              </button>

              <button type='submit' class='btn btn-primary' name='refresh'
                form='task_form'>
                Save and Close
              </button>
              <button type="submit" form='task_form'class="btn btn-primary">
                Save and Go
              </button>
            </div>
          </div>
        </div>
      </div>
    HTML
    modal.html_safe
  end
end
