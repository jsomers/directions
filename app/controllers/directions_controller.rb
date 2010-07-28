class DirectionsController < ApplicationController
  protect_from_forgery :except => [:get_pairs, :upload_summary]
  
  def test
  end
  
  def get_pairs
    n = params[:n].to_i
    cities = City.find(:all, :limit => n * 2, :order => "random()");
    lat_longs = cities.collect {|c| [c.latitude, c.longitude, c.city, c.state]}
    pairs = Hash[*lat_longs].to_a
    render :json => pairs
  end
  
  def upload_summary
    hash = params[:summary]
    (0..(hash.length - 1)).each do |i|
      rt = hash[i.to_s]
      start = rt[1]
      ed = rt[2]
      start_city = start.split(", ").first
      start_state = start.split(", ").last
      end_city = ed.split(", ").first
      end_state = ed.split(", ").last
      sc = City.find_by_city_and_state(start_city, start_state)
      ec = City.find_by_city_and_state(end_city, end_state)
      Route.create(
        :steps => rt[0].to_i,
        :start_city => start_city,
        :start_state => start_state,
        :end_city => end_city,
        :end_state => end_state,
        :start_lat => sc.latitude,
        :start_long => sc.longitude,
        :end_lat => ec.latitude,
        :end_long => ec.longitude
      )
    end
    render :text => "OK"
  rescue
    render :text => "fail"
  end
end
