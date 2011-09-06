#!/usr/bin/env rake
require 'rdoc/task'
require 'date'
require 'rspec/core/rake_task'
require 'digest'
require 'bundler'

task :default => :spec
task :test => :spec

Bundler::GemHelper.install_tasks

desc "Run specs"
RSpec::Core::RakeTask.new(:spec)

def conformance_version(dir)
  Dir[File.join(dir, '*')].inject(Digest::SHA1.new){|digest, file| digest.update(Digest::SHA1.file(file).hexdigest) }
end

namespace :test do
  namespace :conformance do
    desc "Update conformance testing data"
    task :update do
      puts "Updating conformance data ... "
      system("git submodule init") || raise("Failed to init submodule")
      system("git submodule update") || raise("Failed to update submodule")
      puts "Updating conformance data ... DONE"
    end

    desc "Change conformance test data to the lastest version"
    task :latest => ['conformance:update'] do
      current_dir = File.dirname(__FILE__)
      submodule_dir = File.join(File.dirname(__FILE__), "test", "twitter-text-conformance")
      version_before = conformance_version(submodule_dir)
      system("cd #{submodule_dir} && git pull origin master") || raise("Failed to pull submodule version")
      system("cd #{current_dir}")
      if conformance_version(submodule_dir) != version_before
        system("cd #{current_dir} && git add #{submodule_dir}") || raise("Failed to add upgrade files")
        system("git commit -m \"Upgraded to the latest conformance suite\" #{submodule_dir}") || raise("Failed to commit upgraded conformacne data")
        puts "Upgraded conformance suite."
      else
        puts "No conformance suite changes."
      end
    end

    desc "Run conformance test suite"
    task :run do
      ruby "test/conformance_test.rb"
    end
  end

  desc "Run conformance test suite"
  task :conformance => ['conformance:latest', 'conformance:run'] do
  end
end

namespace :doc do
  RDoc::Task.new do |rd|
    rd.main = "README.rdoc"
    rd.rdoc_dir = 'doc'
    rd.rdoc_files.include("README.rdoc", "lib/**/*.rb")
  end
end

desc "runs cruise control build"
task :cruise => [:spec, 'test:conformance'] do
end
