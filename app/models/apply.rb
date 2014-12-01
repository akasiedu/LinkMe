class Apply < ActiveRecord::Base
  belongs_to :company
  belongs_to :job
	 mount_uploader :resume, PictureUploader
	 validates :firstname, presence: true
   # validates :company_id
	 validates :lastname,  presence: true
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
   validates :email, presence: true,
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    validates :phone_number, presence: true, length: { maximum: 10 }
    validates :level_of_education, presence: true
    validates :specialty, presence: true
#     FILE_FORMAT_REGEX = ^.*\.(doc|DOC|pdf|PDF)$
#     validates :resume, presence: true, 
#                         format: { with: FILE_FORMAT_REGEX }

end
