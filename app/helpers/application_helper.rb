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
          <td class='col-1'>
            Username (For later)
          </td>
          <td>
            <div class='update-date font-weight-light text-secondary'>
              #{c.updated_at}
            </div>
            {c.content}
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

end
