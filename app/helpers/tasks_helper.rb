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
    @new_task = Task.new
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
            #{
              render 'tasks/form',
                project: opts[:project],
                task: @new_task,
                parent: opts[:parent]
              }
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

  def get_tasks_listing tasks, options = {}
    task_list = ''

    tasks.each do |task|
      task_list += <<-HTML
        <div class='list-group-item list-group-item-action'>
          <div class='row'>
            <div class='col-1'>#{task.id}</div>
            <div class='col-1'>
              <div data-toggle'tooltip' data-placement='bottom'
                title='#{task.effort.description}'>
                 #{task.effort.name }
              </div>
            </div>
            <div class='col-lg'> #{link_to task.title, task} </div>
            <div class='col-lg ellipsable'> #{task.description} </div>
            <div class='col-1'>
              <div class='badge badge-#{task.status.bootstrap_color}'>
                 #{task.status.name}
              </div>
            </div>
            <div class='col-1'> #{get_priority_pill task.priority}  </div>
          </div>
        </div>
        HTML
    end
    "
    <div class='list-group'>
        <div class='list-group-item list-group-item-dark'>
          <div class='row'>
            <div class='col-1'> Id       </div>
            <div class='col-1'> Effort   </div>
            <div class='col-lg'>Title    </div>
            <div class='col-lg ellipsable'>Description</div>
            <div class='col-1'> Status   </div>
            <div class='col-1'> Priority </div>
          </div>
        </div>
        #{task_list}
    </div>

    ".html_safe
  end

end
