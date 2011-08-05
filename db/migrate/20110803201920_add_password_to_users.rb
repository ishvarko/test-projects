class AddPasswordAndSaltToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :password, :string
  end

  def self.down
    remove_columns(:users, :password)
  end
end
