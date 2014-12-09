class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|

        t.string  :exam_result
        t.integer :student_id
        t.integer :examination_id


      t.timestamps
    end
  end
end
