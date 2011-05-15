class CreateBoozes < ActiveRecord::Migration
  def self.up
    create_table :boozes do |t|
      t.string :name
      t.integer :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :boozes
  end
end
