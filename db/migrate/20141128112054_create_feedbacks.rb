class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
       t.text :feedback_comments
       t.integer :student_id
       
      t.timestamps
    end
  end
end
