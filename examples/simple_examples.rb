# Simple Examples to show up how to use WebDump
# Marcel Massana 1-Sep-2011

require 'rubygems'
require 'open-uri'
require 'web_dump'

MY_URIS = [
  'http://en.wikipedia.org/wiki/Ruby_Bridges',
  'http://donaldfagen.com/disc_nightfly.php',
  'http://www.rubi.cat/ajrubi/portada/index.php',
  'http://www.google.com/cse?q=array&cx=013598269713424429640%3Ag5orptiw95w&ie=UTF-8&sa=Search'
]

# all files will be saved in expanded '~/mydir' with file extension '.gz'
wd = WebDump.new :base_dir => '~/mydir', :file_ext => '.gz'

# Don't care about filenames while saving pages into files
puts "Saving data using URIs"
MY_URIS.each do |uri|
  open uri do |u|
    data = u.read
    puts wd.save uri, data
  end
end

# Possibly mocking?... also don't care about filenames while retrieving pages from files.
puts "\nRetrieving data using URIs"
MY_URIS.each do |uri|
  data = wd.read_uri(uri)
  puts data[0...100].gsub(/\s+/, ' ').strip
end

# ... or, conversely, use filenames if you need so
puts "\nRetrieving data using pathnames"
files = Dir[File.expand_path('*.gz', '~/mydir')]
files.each do |f|
  data = wd.read_pathname(f)
  puts data[0...100].gsub(/\s+/, ' ').strip
end
