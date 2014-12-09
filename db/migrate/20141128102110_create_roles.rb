class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
    	t.string :roletype
    	t.text   :description

      t.timestamps
    end
  end
end
