class AddAttachPaperclip < ActiveRecord::Migration
  def change

      add_column :submitted_assignments, :attach_file_name,    :string
      add_column :submitted_assignments, :attach_content_type, :string
      add_column :submitted_assignments, :attach_file_size,    :integer
      add_column :submitted_assignments, :attach_updated_at,   :datetime
  
    



  end
end
