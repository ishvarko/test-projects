class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string :number, :limit => 10
      t.string :customer_name
      t.string :customer_email
      t.string :subject
      t.text :request_text
      t.integer :department
      t.integer :status, :default => 1
      t.integer :owner
      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
