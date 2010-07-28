class Route < ActiveRecord::Base
  EARTH_RHO = 3963.1676;
  def calc_distance
    pi = Math::PI;
    lat1 = self.start_lat * pi / 180;
    long1 = self.start_long * pi / 180;
    lat2 = self.end_lat * pi / 180;
    long2 = self.end_long * pi / 180;
    x1 = Math::sin(lat1) * Math::cos(long1);
    y1 = Math::sin(lat1) * Math::sin(long1);
    z1 = Math::cos(lat1);
    x2 = Math::sin(lat2) * Math::cos(long2);
    y2 = Math::sin(lat2) * Math::sin(long2);
    z2 = Math::cos(lat2);
    begin
      angle = Math::acos((x1 * x2) + (y1 * y2) + (z1 * z2));
    rescue
      angle = 0.0;
    end
    surface_distance = angle * EARTH_RHO;
    return surface_distance;
  end
end
