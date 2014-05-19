#= require jquery.easing

ready = ->
  $('.menu-button').click ->
    if $('.menu-button').hasClass('active')
      $('.main-menu').stop()
      $('.main-menu').animate({
        left: -300
      }, 500, "easeOutBack")
      $('.menu-button').removeClass('active')
    else
      $('.main-menu').stop()
      $('.main-menu').animate({
        left: 0
      }, 500, "easeOutQuart")
      $('.menu-button').addClass('active')





$(document).ready(ready)
$(document).on('page:load', ready)
