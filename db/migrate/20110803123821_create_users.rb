class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username, :limit => 15
      t.string :name
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end