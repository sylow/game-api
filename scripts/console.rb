require 'listen'
pid = fork { exec("rails c") }
listener = Listen.to('app/', only: /\.rb$/) do |modified, added, removed|
  puts "Restarting........"
  Process.kill("HUP", pid)
  fork { exec("pkill -f rails_console")}
  pid = fork { exec("rails c") }
end
listener.start # not blocking
sleep