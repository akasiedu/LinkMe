class Job < ActiveRecord::Base
	belongs_to :company
	mount_uploader :company_logo, PictureUploader
	validates_presence_of :company_logo
	validates :company_name, presence: true, 
						length: { minimum: 5 }
	validates :job_description, presence: true, 
						length: { minimum: 5 }
end
