# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "web_dump"
  s.version = "0.0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marcel Massana"]
  s.date = "2011-09-01"
  s.description = "Saves and Retrieves data given an URI. The filename will be automatically choosed using that URI freeing the user to think about that"
  s.email = "xaxaupua@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "examples/simple_examples.rb",
    "lib/web_dump.rb",
    "lib/web_dump/version.rb",
    "test/test_web_dump.rb",
    "web_dump.gemspec"
  ]
  s.homepage = "http://github.com/syborg/web_dump"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Saves and Retrieves data in files given an URI"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<uri_pathname>, [">= 0"])
    else
      s.add_dependency(%q<uri_pathname>, [">= 0"])
    end
  else
    s.add_dependency(%q<uri_pathname>, [">= 0"])
  end
end

