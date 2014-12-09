class CreateSubmittedExaminations < ActiveRecord::Migration
  def change
    create_table :submitted_examinations do |t|
          t.integer :examination_id
          t.integer :student_id
          
      t.timestamps
    end
  end
end
