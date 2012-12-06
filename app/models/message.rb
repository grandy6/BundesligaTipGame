class Message < ActiveRecord::Base
	has_many :user_messages
	has_many :users, through: :user_messages
 	attr_accessible :content, :from, :to, :message_tokens
 	attr_reader :message_tokens
 	def message_token=(ids)
 		self.user_ids = ids.split(",")
 	end
end
