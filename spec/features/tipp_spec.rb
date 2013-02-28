require 'spec_helper'

describe "Teams" do 
	before :each do
		User.new

		visit "/login/"
		fill_in "user_username", :with => 'Testuser'
		fill_in "user_password", :with => '12345678'
		click_button "signin"
		click_link "Meine Tipps"
		click_link "34"
		fill_in "20243_87" => '1'
		fill_in "20243_40" => '1'
		click_button "commit"
		page.should have_content '1 1'
	end
	context 'start page' do 
		let!(:team) { Team.new owner_id: '1', name: 'Name', is_public: '1', points: '1' }

	end

end4