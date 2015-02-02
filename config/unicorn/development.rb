# paths
application = 'news'

app_path = `pwd`
app_path = app_path.chomp!
working_directory "#{app_path}"
listen "#{app_path}/tmp/sockets/unicorn_#{application}.sock", backlog: 64
pid "#{app_path}/tmp/pids/unicorn_#{application}.pid"

# logging
stderr_path File.expand_path('log/unicorn.stderr.log', ENV['RAILS_ROOT'])
stdout_path File.expand_path('log/unicorn.stdout.log', ENV['RAILS_ROOT'])

# workers
worker_processes 1

# use correct Gemfile on restarts
before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{app_path}/Gemfile"
end

# preload
preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{ server.config[:pid] }.oldbin"
  unless old_pid == server.pid
  begin
    Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
  #GC.disable
end
