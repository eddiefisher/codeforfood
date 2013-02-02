current = File.expand_path(File.join(File.dirname(__FILE__), '../../current'))

worker_processes 10
working_directory current

preload_app true

pid File.join(current, 'tmp/pids/unicorn.pid')
listen File.join(current, 'tmp/sockets/unicorn.sock'), :backlog => 64

timeout 30

stderr_path File.join(current, 'log/unicorn.stderr.log')
stdout_path File.join(current, 'log/unicorn.stdout.log')

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end