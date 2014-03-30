class Comment < ActiveRecord::Base
	attr_accessible :content
	validates :user_id, presence: true
	validates :micropost_id, presence: true
	validates :content, presence: true, length: {maximum: 500}
	belongs_to :user
	belongs_to :micropost
	default_scope order: "comments.created_at DESC"
end
