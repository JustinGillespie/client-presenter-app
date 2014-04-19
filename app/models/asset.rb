class Asset < ActiveRecord::Base
	#validates_presence_of :title
	#validates_length_of :title, minimum: 3, maximum: 20
	belongs_to :group
	mount_uploader :image, ImageUploader
	before_create :default_title

private

	def default_title
 		self.title = File.basename(image.filename, '.*').titleize
	end

end
