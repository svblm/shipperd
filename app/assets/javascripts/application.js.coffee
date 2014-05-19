#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require pnotify
#= require_tree .

toast = (message, type) ->
  console.log(message)

ready = ->
  if $('.notification').exists
    toast($('.notification').text, 'info')

$(document).ready(ready)
$(document).on('page:load', ready)
