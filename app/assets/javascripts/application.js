// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//
$(function (){
	$.urlParam = function(name){
	    var results = new RegExp('[\\?&amp;]' + name + '=([^&amp;#]*)').exec(window.location.href);
	    if(results == null)
	    	return null;
	    else
	    	return results[1] || 0;
	}


	var currentItem = null;
	$.getJSON("/getusers/show.json", 
		function(data) {
			users = $.urlParam('to').split(',');

			$.each(data, function(key, val) {
				if($.inArray(val.id.toString(), users) != -1) {
					if(currentItem == null)
						currentItem = "";
					currentItem += '{"id": ' + val.id + ', "name": "' + val.name + '"},';
				}
					console.log(currentItem);
			});
			
			if(currentItem != null) {
				currentItem = currentItem.substring(0, currentItem.length -1);
				currentItem = "[" + currentItem + "]";
				currentItem = $.parseJSON(currentItem);
			}

			$('#message_user_ids').tokenInput('/getusers/show.json', {
		  	crossDomain: false,  
		    prePopulate: currentItem, 
		  	theme: 'facebook' 
		  }); 
	});
 
 
// Funktion zum ausblenden der leeren Fehler-Divs

	if(!$(".notice").text() == "")
	{
		 $(".notice").show();
	}

	if(!$(".alert").text() == "")
	{
		 $(".alert").show();
	}
});
