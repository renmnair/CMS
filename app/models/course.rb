class Course < ActiveRecord::Base
validates :course_name, :duration, presence: true
  has_many :students
  has_many :assignments

end
