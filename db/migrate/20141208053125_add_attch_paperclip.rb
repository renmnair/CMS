class AddAttachPaperclip < ActiveRecord::Migration
  def change
  
def self.up
     add_column :submitted_assignments, :attach_file_name,    :string
      add_column :submitted_assignments, :attach_content_type, :string
      add_column :submitted_assignments, :attach_file_size,    :integer
      add_column :submitted_assignments, :attach_updated_at,   :datetime
    end
  
    def self.down
     remove_column :submitted_assignments, :attach_file_name
     remove_column :submitted_assignments, :attach_content_type
     remove_column :submitted_assignments, :attach_file_size
     remove_column :submitted_assignments, :attach_updated_at
   end



  end
end
