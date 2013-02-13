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

	var currentItem = "";
	$.getJSON("http://localhost:3000/getusers/show.json", 
		function(data) {
			$.each(data, function(key, val) {
				if(val.id == $.urlParam('to'))
					currentItem = '[{"id": ' + val.id + ', "name": "' + val.name + '"}]';
		});
		$('#message_user_ids').tokenInput('/getusers/show.json', {
		  	crossDomain: false,  
		    prePopulate: $.parseJSON(currentItem), 
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
