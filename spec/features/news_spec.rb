require 'spec_helper'

describe "News" do 
		let!(:category) { Category.new name: 'Bundesliga' }
		let!(:news) { News.new owner_id: '1', name: 'Name', is_public: '1', points: '1' }
end