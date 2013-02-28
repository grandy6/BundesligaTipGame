require 'spec_helper'

describe "Messages" do 
	before :each do
		User.new

		visit "/login/"
		fill_in "user_username", :with => 'Testuser'
		fill_in "user_password", :with => '12345678'
		click_button "signin"
		click_link "Nachrichten"
		click_link "New Message"
		fill_in "token-input-message_user_ids" => 'till'
		fill_in "message_title" => 'Test-Title'
		fill_in "message_content" => 'Test-Content-Lorem-Ipsum'
		click_button "commit"
		page.should have_content 'Message was successfully created.'
	end
	

end