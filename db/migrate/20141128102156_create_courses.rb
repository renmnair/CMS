class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|

       
        t.string :course_name
        t.string :duration

      t.timestamps
    end
  end
end
