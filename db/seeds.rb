# This file should contain the simple list of files to be executed in a given order.
# All the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# You can also seed only some files from seeds folder with rake db:seed only=file1,file2
#
# Examples:
#
#   rake db:seed
#   rake db:seed only=admin_users,articles

scope = "all"
scope = ENV["only"] unless ENV["only"].blank?

files = [
  'admin_users'
]

scopes = []
if scope.include? ","
  scopes = scope.split(",")
elsif scope == 'all'
  files.each do |file|
    scopes << file
  end
else
  scopes << scope
end

scopes.each do |file|
  puts ""
  puts ""
  puts "\t\t\t---===[ Seeding file: #{file}... ]===---"
  puts ""
  puts ""
  require File.expand_path("../seeds/#{file}", __FILE__)
end
