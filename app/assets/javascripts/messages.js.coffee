# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/ 

window.Application ||= {}
Application.showContent = (pthis, pID) ->
	if $("#message_" + pID).is(':visible')
  	$(pthis).find('img').attr('src', '/assets/icons/down.png')
  else
  	$(pthis).find('img').attr('src', '/assets/icons/up.png')
  
	$("#message_" + pID).slideToggle("slow")