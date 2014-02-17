class Micropost < ActiveRecord::Base
	attr_accessible :content
	validates :user_id, presence: true
	validates :content, presence: true, length: {maximum: 500}
	belongs_to :user
	default_scope order: 'microposts.created_at DESC'

	def maximum_length
		return maximum = 500
	end
end
