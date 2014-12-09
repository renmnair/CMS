class CreateSubmittedAssignments < ActiveRecord::Migration
  def change
      create_table :submitted_assignments do |t|
        
           t.string  :assignment_answer 
           t.integer :assignment_id
           t.integer :student_id
           t.timestamps
    end
  end
end
