require 'resque/scheduler'

Resque.redis = 'localhost:6379'
Resque.schedule = YAML.load_file(Rails.root.join('config', 'resque_schedule.yml'))
