require 'spec_helper.rb'

describe User do
	it 'is valid' do
		user = User.create :firstname => 'Max',
						:lastname => 'Mustermann', 
						:username => 'admin', 
						:email => 'admin@example.com', 
						:password => 'password', 
						:password_confirmation => 'password',
						:birthday => '2013-02-21'
		user.should be_valid
	end
	it 'needs unserinformations' do
		user = User.create 
		user.should_not be_valid
	end
end