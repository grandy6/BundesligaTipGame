require 'spec_helper'

describe "Teams" do 
	before :each do
		User.new

		visit "/login/"
		fill_in "user_username", :with => 'Testuser'
		fill_in "user_password", :with => '12345678'
		click_button "signin"
		click_link "Meine Tippgemeinschaft"
		fill_in "team_name" => 'Testteam1'
		click_button "commit"
		page.should have_contentn 'Team was successfully created.'
	end
	context 'start page' do 
		let!(:team) { Team.new owner_id: '1', name: 'Name', is_public: '1', points: '1' }

	end

end