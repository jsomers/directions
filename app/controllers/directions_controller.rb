class DirectionsController < ApplicationController
  protect_from_forgery :except => [:get_pairs]
  
  def test
  end
  
  def get_pairs
    n = params[:n].to_i
    cities = City.find(:all, :limit => n * 2, :order => "random()");
    lat_longs = cities.collect {|c| [c.latitude, c.longitude, c.city, c.state]}
    pairs = Hash[*lat_longs].to_a
    render :json => pairs
  end
end
