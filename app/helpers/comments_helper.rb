module CommentsHelper
  def icon_link(icon_name, model)
    link_to(fa_icon(icon_name, class: 'user-icon'), model, class: 'text-muted')
  end
end
