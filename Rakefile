require 'rake/testtask'
require 'sinatra/activerecord/rake'
require './app'

task :default => [:'']

desc "Run all tests"
task :'' do
  test_task = Rake::TestTask.new("alltests") do |t|
    t.test_files = Dir.glob(File.join("test", "**", "*_test.rb"))
  end
  task("alltests").execute
end

namespace :test do
  desc "Run models tests"
  task :models do
    ruby "test/models/*_test.rb"
  end

  desc "Run routes tests"
  task :routes do
    ruby "test/routes/*_test.rb"
  end
end
