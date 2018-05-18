# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'turbolinks:load', ->
  new_status = document.getElementById('new_status')
  buttons    = document.getElementsByClassName('new-status')
  click      = (b) ->
    b.addEventListener 'click', (e) ->
      document.getElementById('Task_status').value = b.value
      new_status.innerHTML = b.innerHTML
      new_status.setAttribute('class', 'text-' + b.getAttribute('data-bootstrap'))

  click b for b in buttons

