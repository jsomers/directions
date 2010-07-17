class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.string :city
      t.string :state
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end

  def self.down
    drop_table :cities
  end
end
