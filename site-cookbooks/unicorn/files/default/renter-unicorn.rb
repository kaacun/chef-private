application = 'sumapita-renter'
rails_root = '/app/'+ application + '/production/current'

worker_processes 2
#working_directory "/app/" + application
working_directory rails_root
 
listen "/var/run/unicorn/unicorn_" + application + ".sock"
pid "/var/run/unicorn/unicorn_" + application + ".pid"
#pid "/app/" + application + "/tmp/pids/unicorn.pid"
 
timeout 60
 
preload_app true # ダウンタイムをなくす
 
#stdout_path "/app/" + application + "/log/unicorn.stdout.log"
#stderr_path "/app/" + application + "/log/unicorn.stderr.log"
stdout_path rails_root + "/log/unicorn.stdout.log"
stderr_path rails_root + "/log/unicorn.stderr.log"
 
GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true
 
before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
 
  old_pid = "#{server.config[:pid]}.oldbin"
    if old_pid != server.pid
      begin
        sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
        Process.kill(sig, File.read(old_pid).to_i)
      rescue Errno::ENOENT, Errno::ESRCH
      end
    end
 
    sleep 1
  end
 
after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
