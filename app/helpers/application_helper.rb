# frozen_string_literal: true

# Methods that are useful between controllers
module ApplicationHelper
  def bootstrap_colors_helper
    [
      %w[Primary primary],
      %w[Secondary secondary],
      %w[Success success],
      %w[Danger danger],
      %w[Warning warning],
      %w[Info info],
      %w[Light light],
      %w[Dark dark]
    ]
  end
end
