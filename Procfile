redis: redis-server
resque_worker: bundle exec rake QUEUE=pull_cbr_queue resque:work VERBOSE=true >> log/rescue_work_$PORT.log 2>&1
rescue_scheduler: bundle exec rake resque:scheduler VERBOSE=true >> log/rescue_scheduler_$PORT.log 2>&1
web: PORT=3000 bundle exec puma -C config/puma.rb 