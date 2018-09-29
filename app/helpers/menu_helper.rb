module MenuHelper
  def menu_items

    Dir.glob(Rails.root + '/app/models/*.rb').each do |file|
      menu_items << {controller: pluralize(file)}
    end
    # TODO: Get a list of routes
    [
      {controller: 'Tasks',    name: 'Tasks',    path: tasks_path    } ,
      {controller: 'Statuses', name: 'Statuses', path: statuses_path } ,
      {controller: 'Efforts',  name: 'Efforts',  path: efforts_path  } ,
      {controller: 'Projects', name: 'Projects', path: projects_path } ,
      {controller: 'Comments', name: 'Comments', path: comments_path } ,
      {controller: 'Domains',  name: 'Domains',  path: domains_path  } ,
      {controller: 'People',   name: 'People',   path: people_path   } ,
      {controller: 'Users',    name: 'Users',    path: users_path    }
    ]
  end

  # Generate the menu contents based on the arguments given
  def ul_linked_bootstrap_menu args

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

end
