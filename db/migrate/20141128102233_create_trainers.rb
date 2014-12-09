class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string   :employee_number 
      t.date     :joining_date
      t.string   :first_name 
      t.string 	 :middle_name 
	  t.string     :last_name 
      t.string   :gender
      t.string   :qualification 
      t.text     :experience_detail
      t.integer  :experience_year 
      t.text     :home_address 
      t.string   :mobile_phone 
      t.integer  :user_id
      t.integer  :course_id
      
      t.timestamps
    
    end
  end
end
