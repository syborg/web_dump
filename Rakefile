require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  require './lib/web_dump/version'
  Jeweler::Tasks.new do |gem|
    gem.name = "web_dump"
    gem.summary = %Q{Saves and Retrieves data in files given an URI}
    gem.description = %Q{Saves and Retrieves data given an URI. The filename
      will be automatically choosed using that URI freeing the user to think
      about that}.gsub(/\s+/,' ')
    gem.email = "xaxaupua@gmail.com"
    gem.homepage = "http://github.com/syborg/web_dump"
    gem.authors = ["Marcel Massana"]
    gem.add_dependency "uri_pathname", ">= 0"
    # gem.add_development_dependency "thoughtbot-shoulda", ">= 0"
    gem.version = WebDump::Version::STRING
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "web_dump #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
