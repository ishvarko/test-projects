class CreateDepartments < ActiveRecord::Migration
  def self.up
    create_table :departments do |t|
      t.string :name
      t.timestamps
    end
    Department.reset_column_information
    Department.create(:name => 'Sales') 
    Department.create(:name => 'IT Support') 
  end

  def self.down
    drop_table :departments
  end
end
