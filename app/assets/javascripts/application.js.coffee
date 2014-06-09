#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require pnotify
#= require jquery-fileupload
#= require bootstrap
#= require_tree .

toast = (message, type) ->
  elem = $('body').append("<div class='toast #{type}'>#{message}</div>")
  $('.toast').addClass('popup')
  setTimeout (-> $('.toast').removeClass('popup')), 4000

ready = ->
  if $('.notification').length
    toast($('.notification').text(), 'info')

$(document).ready(ready)
$(document).on('page:load', ready)
