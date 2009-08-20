# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :cron_log, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
every :sunday, :at => "9am" do
  rake "auto_remind"
end

every 20.minutes do
  #Do we really want to warn people every 20 mins if they have an overdue payform?
  #rake "auto_warn"
  command "/usr/bin/ar_sendmail -o --batch-size 20 --chdir /home/kwabena/work/newstc"
end

