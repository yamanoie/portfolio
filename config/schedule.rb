# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever



# equire File.expand_path(File.dirname(__FILE__) + "/environment")

# set :output, "log/crontab.log"

# rails_env = ENV['RAILS_ENV'] || :development

# set :environment, :rails_env

# every 1.minute do
# 	runner Notification.destroy_notification
# end

# every 1.month do
# 	runner Notification.destroy_notification
# end

# def destroy_notification
# 	@notifications = Notification.all
# 	@notifications.each do |notification|
# 		notification.destroy
# 	end
# end