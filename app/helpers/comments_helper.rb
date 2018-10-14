module CommentsHelper

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

end
