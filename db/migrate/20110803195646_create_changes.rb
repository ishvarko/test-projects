class CreateChanges < ActiveRecord::Migration
  def self.up
    create_table :changes do |t|
      t.integer :ticket_id 
      t.integer :owner_old
      t.integer :owner_new
      t.integer :status_old
      t.integer :status_new
      t.text    :reply_text
      t.timestamps
    end
  end

  def self.down
    drop_table :changes
  end
end
