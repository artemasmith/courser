# namespace :resque do
#   task :setup do
#     # http://www.rubydoc.info/gems/resque-scheduler/3.0.0/file/README.md#Rake_integration
#     require 'resque'
#     require 'resque-scheduler'
    
#     Resque.redis = ENV['RESQUE_REDIS'] unless ENV['RESQUE_REDIS'].blank?
    
#     # @WARNING 2014-11-18 due to the bug (https://github.com/resque/resque-scheduler/issues/369) in resque-scheduler, this does not work right now
#     Resque::Scheduler.dynamic = true
#     # @WORKAROUND run DYNAMIC_SCHEDULE=true as a workaround
#     ENV['DYNAMIC_SCHEDULE'] = 'true'
#   end
# end

# require 'resque/tasks'  
# task "resque:setup" => :environment

require "resque/tasks"

task "resque:setup" => :environment

require 'resque/scheduler/tasks'
namespace :resque do
  task :setup do
    require 'resque'

    # you probably already have this somewhere
    Resque.redis = 'localhost:6379'
  end

  task :setup_schedule => :setup do
    require 'resque-scheduler'

    # If you want to be able to dynamically change the schedule,
    # uncomment this line.  A dynamic schedule can be updated via the
    # Resque::Scheduler.set_schedule (and remove_schedule) methods.
    # When dynamic is set to true, the scheduler process looks for
    # schedule changes and applies them on the fly.
    # Note: This feature is only available in >=2.0.0.
    # Resque::Scheduler.dynamic = true

    # The schedule doesn't need to be stored in a YAML, it just needs to
    # be a hash.  YAML is usually the easiest.
    Resque.schedule = YAML.load_file('config/resque_schedule.yml')

    # If your schedule already has +queue+ set for each job, you don't
    # need to require your jobs.  This can be an advantage since it's
    # less code that resque-scheduler needs to know about. But in a small
    # project, it's usually easier to just include you job classes here.
    # So, something like this:
  end

  task :scheduler => :setup_schedule
end