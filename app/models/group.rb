class Group < ActiveRecord::Base
	validates_presence_of :title
	validates_length_of :title, minimum: 3, maximum: 20
	
	belongs_to :project
	has_many :assets, dependent: :destroy
end
