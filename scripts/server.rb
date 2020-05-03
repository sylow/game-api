require 'listen'
pid = fork { exec("rails s") }
listener = Listen.to('app/', only: /\.rb$/) do |modified, added, removed|
  puts "Restarting........"
  Process.kill("HUP", pid)
  fork { exec("pkill -f puma")}
  pid = fork { exec("rails s") }
end
listener.start # not blocking
sleep