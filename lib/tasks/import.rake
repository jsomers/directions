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
      
    end
  end
end