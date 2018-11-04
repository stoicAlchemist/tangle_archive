# frozen_string_literal: true

# Helpers to build Menu elements
module MenuHelper
  MENU = %w[tasks statuses efforts projects domains people users].freeze
  def menu_items
    Dir.glob(Rails.root + '/app/models/*.rb').each do |file|
      menu_items << { controller: pluralize(file) }
    end
    items = []
    MENU.each do |i|
      items << { controller: i.capitalize, name: i.capitalize,
                 path: send(i + '_path') }
    end
    items
  end

  def check_active(link)
    'active' if controller.controller_name.include? link[:controller].downcase
  end
end
