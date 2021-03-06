# config/unicorn.rb
if ENV['RACK_ENV'] == 'development' || ENV['RAILS_ENV'] == 'development'
  worker_processes 1
  listen "#{ENV['BOXEN_SOCKET_DIR']}/mock-rws", :backlog => 1024
  timeout 120
else
  worker_processes 3
  timeout 60
  listen "#{ENV['PORT']}", :backlog => 1024
end

before_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to sent QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end