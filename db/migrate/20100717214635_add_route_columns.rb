class AddRouteColumns < ActiveRecord::Migration
  def self.up
    add_column :routes, :steps, :integer
    add_column :routes, :distance, :float
  end

  def self.down
    remove_column :routes, :steps
    remove_column :routes, :distance
  end
end
