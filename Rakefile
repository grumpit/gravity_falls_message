require "bundler/gem_tasks"

require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs = ['lib', 'test']
  t.test_files = FileList['test/test_helper.rb', 'test/*_test.rb']
end

task default: :test
