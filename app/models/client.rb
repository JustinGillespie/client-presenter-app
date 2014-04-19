class Client < ActiveRecord::Base

	validates_presence_of :name
	validates_length_of :name, minimum: 3
	
	has_many :users
	has_many :projects, dependent: :destroy
end
