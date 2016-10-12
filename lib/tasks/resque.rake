require 'resque/tasks'
require 'resque/scheduler/tasks'

# task "resque:setup" => :environment do
#   ENV['QUEUE'] = 'pull_cbr_queue'
# end
task 'resque:setup' => :environment