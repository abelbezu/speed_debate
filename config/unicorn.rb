root = "/home/users/tadesse/speed_debate/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.speed_debate.sock"
worker_processes 1
timeout 30