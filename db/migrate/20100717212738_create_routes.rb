class CreateRoutes < ActiveRecord::Migration
  def self.up
    create_table :routes do |t|
      t.string :start_city
      t.string :start_state
      t.string :end_city
      t.string :end_state
      t.float :start_lat
      t.float :start_long
      t.float :end_lat
      t.float :end_long
      t.timestamps
    end
  end

  def self.down
    drop_table :routes
  end
end
