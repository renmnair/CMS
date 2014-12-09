class Trainer < ActiveRecord::Base
validates :employee_number,:joining_date, :first_name , :last_name, :gender, :qualification, :experience_detail, :home_address, :mobile_phone, presence: true
belongs_to :user, foreign_key: "user_id"
has_one :course

end
