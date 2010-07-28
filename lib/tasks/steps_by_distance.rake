namespace :make do
  task :steps_by_distance => :environment do
    f = File.new("#{RAILS_ROOT}/lib/steps_by_distance.txt", "w")
    Route.find(:all).each do |rt|
      f.puts "#{rt.steps}\t#{rt.distance}"
    end
  end
end