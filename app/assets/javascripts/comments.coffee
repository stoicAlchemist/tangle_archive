# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'turbolinks:load', ->
  comment_content = document.getElementById('comment_content')

  if comment_content

    comment_content.addEventListener 'keydown', (k) ->
      if k.key == 'Enter' and (k.metaKey or k.ctrlKey)
        document.getElementById('comment_form').submit()

