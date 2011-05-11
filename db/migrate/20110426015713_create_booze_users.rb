class CreateBoozeUsers < ActiveRecord::Migration
  def self.up
    create_table :booze_users do |t|
      t.integer :user_id
      t.integer :booze_id
      t.integer :user_rating
      t.timestamps
    end
  end

  def self.down
    drop_table :booze_users
  end
end
