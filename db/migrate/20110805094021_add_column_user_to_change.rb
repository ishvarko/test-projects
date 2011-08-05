class AddColumnUserToChange < ActiveRecord::Migration
  def self.up
    add_column :changes, :user, :integer
  end

  def self.down
  end
end
