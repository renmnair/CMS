class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|
         t.string      :exam_title
         t.datetime    :start_date
         t.datetime    :end_date
         t.integer     :course_id
      t.timestamps
    end
  end
end
