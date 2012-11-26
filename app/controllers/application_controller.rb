class ApplicationController < ActionController::Base
	$liga_id = 456
	$liga_short = "bl1"
	$saison = 2012
	$last_change = DateTime.now
	
  protect_from_forgery
end
