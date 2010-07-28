namespace :import do
  task :cities => :environment do
    raw = File.open("#{RAILS_ROOT}/lib/us_cities.txt", "r").read
    lines = raw.split("\n")
    lines.each do |line|
      fields = line.split(",")
      City.create(
        :city => fields[2],
        :state => fields[3],
        :latitude => fields[5].to_f,
        :longitude => fields[6].to_f
      )
    end
  end
  
  task :initial_routes => :environment do
    raw = File.open("#{RAILS_ROOT}/lib/initial_routes.txt", "r").read
    lines = raw.split("\n")
    lines.each do |line|
      begin
        start_city = line[/from (.*?), (.*?) to/, 1]
        start_state = line[/from (.*?), (.*?) to/, 2]
        end_city = line[/to (.*?), (.*?) has/, 1]
        end_state = line[/to (.*?), (.*?) has/, 2]
        sc = City.find_by_city_and_state(start_city, start_state)
        ec = City.find_by_city_and_state(end_city, end_state)
        Route.create(
          :start_city => start_city,
          :start_state => start_state,
          :end_city => end_city,
          :end_state => end_state,
          :start_lat => sc.latitude,
          :start_long => sc.longitude,
          :end_lat => ec.latitude,
          :end_long => ec.longitude,
          :steps => line[/has (\d+) steps/, 1].to_i
        )
      rescue Exception => e
        puts e
        p line
      end
    end
  end
end