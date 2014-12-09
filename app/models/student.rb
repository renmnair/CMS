class Student < ActiveRecord::Base
validates :admission_no, :admission_date ,:first_name ,:last_name ,:date_of_birth, :gender, :address, :phone, presence: true 
belongs_to :user, foreign_key: "user_id"
has_one :course
has_many :submitted_assignment

end
