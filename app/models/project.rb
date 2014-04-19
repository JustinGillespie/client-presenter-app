class Project < ActiveRecord::Base
	belongs_to :client
	has_many :groups, dependent: :destroy
end
