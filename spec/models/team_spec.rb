require 'spec_helper.rb'

describe Team do
	it 'is valid' do
		team = Team.create :owner_id => '1',
		:name => 'TeamName123',
		:is_public => '1',
		:points => '2'
		team.should be_valid
	end

		it 'needs Teaminformations' do
		team = Team.create 
		team.should_not be_valid
	end
end