module ApplicationHelper

  def menu_items

    # Get a list of routes

    [
      {controller: 'Tasks',    name: 'Tasks',    path: tasks_path},
      {controller: 'Statuses', name: 'Statuses', path: statuses_path},
      {controller: 'Efforts',  name: 'Efforts',  path: efforts_path},
      {controller: 'Projects',  name: 'Projects',  path: projects_path},
      {controller: 'Comments',  name: 'Comments',  path: comments_path},
      {controller: 'Domains',  name: 'Domains',  path: domains_path}
    ]
  end

  # Generate the menu contents based on the arguments given
  def ul_linked_boostrap_menu args

    menu  = ''
    args[:items].each do |a|
      menu += <<-HTML
        <li class="nav-item">
          #{link_to a[:name], a[:path], class: "nav-link
          #{'active' if check_active a}"}
        </li>
      HTML
    end
    "<ul class=\"navbar-nav #{args[:class]}\">#{menu}</ul>".html_safe
  end

  def check_active link
    controller.controller_name.include? link[:controller].downcase
  end

  def bootstrap_colors_helper
    [
      ["Primary"  , 'primary'    ],
      ["Secondary", 'secondary'  ],
      ["Success"  , 'success'    ],
      ["Danger"   , 'danger'     ],
      ["Warning"  , 'warning'    ],
      ["Info"     , 'info'       ],
      ["Light"    , 'light'      ],
      ["Dark"     , 'dark'       ]
    ]
  end

  def commentable_form commentable

    table = ''
    commentable.comments.each do |c|
      table += <<-HTML
        <tr scope='row'>
          <td class='col-1 comment-user-info'>
            #{link_to fa_icon('user', class: 'user-icon'), c.creator,
            class: 'text-muted'}
            <div class='bottom-username text-muted'>
              #{c.creator.username}
            </div>
          </td>
          <td>
            <div class='update-date font-weight-light text-secondary'>
              #{c.updated_at}
            </div>
            #{c.content}
          </td>
          <td>
            Actions (for later)
          </td>
        </tr>
      HTML
    end
    form = <<-HTML
      <section name='comments' class='comment-stack'>
        <h4>Comments</h4>
        <table class='table table-compact'>
          <thead>
            <tr scope='col'></tr>
            <tr scope='col'></tr>
            <tr scope='col'></tr>
          </thead>
          <tbody>
            #{table}
          </tbody>
        </table>

        #{render 'comments/form', commentable: commentable}

      </section>
      HTML
    form.html_safe
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
