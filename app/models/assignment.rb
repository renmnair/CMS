class Assignment < ActiveRecord::Base
validates :assignment_title, :start_date, :end_date, :course_id, presence: true
belongs_to :course

has_many :submitted_assignments


end
