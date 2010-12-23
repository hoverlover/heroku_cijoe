require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

project = ENV['cijoe_git_url'].split('/').last.chomp('.git')
CIJoe::Server.set :project_path, File.expand_path("tmp/projects/#{project}")

puts "Starting CI Joe"
run CIJoe::Server
