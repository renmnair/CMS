class RemoveColumnFromStudents < ActiveRecord::Migration
  def change
  remove_column :students, :resume_filename , :string


  end
end
