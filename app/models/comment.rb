class Comment < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :text
	validates_presence_of :post_id
	belongs_to :post
end 
