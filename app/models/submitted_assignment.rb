class SubmittedAssignment < ActiveRecord::Base
validates :assignment_id, presence: true
belongs_to :student
belongs_to :assignment
has_attached_file :attach
validates_attachment_content_type :attach, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"]
end
