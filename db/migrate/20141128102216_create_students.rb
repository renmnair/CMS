class CreateStudents < ActiveRecord::Migration

  def change
    create_table :students do |t|
       
       t.string  :admission_no 
       t.date    :admission_date 
       t.string  :first_name 
       t.string  :middle_name 
       t.string  :last_name
       t.date    :date_of_birth
       t.string  :gender 
	     t.string  :blood_group 
	     t.string  :language
	     t.text    :address
       t.string  :phone
       t.string  :resume_filename 
       t.integer :user_id 
       t.integer :course_id

      t.timestamps
    end
  end
end
