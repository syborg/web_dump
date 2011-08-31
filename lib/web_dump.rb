# WebDump
# MME 31/8/2011
#
# Allows saving and reading data related to URIs (i.e. pages)

require 'web_dump/version'
require 'uri'
require 'zlib'
require 'fileutils'
require 'rubygems'
require 'uri_pathname'

# Allows saving and reading data related to URIs (i.e. pages)
class WebDump

  #default attributes
  DEFAULT_ATTRS = {
      :base_dir => '~/web_dumps',
      :file_ext => '.html'
    }

  attr_accessor :up, *(DEFAULT_ATTRS.keys)

  # initializes a WebDump object. +options+ should be a hash with options for
  # an UriPathname object that will be internally created. Default UriPathnames
  # options and additionally:
  #    :base_dir => directory where everything will be stored (def. '~/web_dumps')
  #    :file_ext => extension that will be appended to filenames (def. '.html')
  def initialize(options = {})

    attributes = DEFAULT_ATTRS.merge options if options.is_a? Hash
    attributes.each { |k,v| instance_eval("@#{k}='#{v}'") if DEFAULT_ATTRS.keys.include?(k) }

    @up=UriPathname.new attributes  # any valid option passed will be delivered

  end

  # saves the +content+ (String) into a file named after
  # UriPathname#uri_to_pathname(+uri+).
  # If +extension+ is nil initialize :file_ext option will be used:
  #   'anything'+'.gz' ->  gzipped (less storage requirements)
  #   other ->  as is
  # returns a String containing the complete pathname of the file if OK else nil
  def save(uri, content, extension = nil)
    extension = @file_ext unless extension
    pathname = @up.uri_to_pathname(uri,nil,extension)
    return nil unless pathname
    mkdir_if_not_exists(File.dirname(pathname))
    num_bytes = nil
    case extension
    when /\.gz$/  # ...gz
      File.open(pathname, 'w') do |f|
        gz = Zlib::GzipWriter.new(f)
        # gz.comment="#dumped with web_dump #{Version::STRING}: #{uri}" # no sembla fer res
        num_bytes = gz.write content
        gz.close
      end
    else # any other
      File.open(pathname, 'w') do |f|
        num_bytes = f.write(content)
      end
    end
    num_bytes ? pathname : nil
  end

  # returns the stored content corresponding to file +pathname+. In case there
  # isn't any file it returns nil.
  def read_pathname(pathname)
    content = nil
    arr = @up.parse pathname
    complete_pathname = File.expand_path(pathname)
    extension = arr[2]
    case extension
    when /.gz/
      File.open(complete_pathname, 'r') do |f|
        gz = Zlib::GzipReader.new(f)
        content = gz.read
        gz.close
      end
    else # others as is
      File.open(complete_pathname, 'r') do |f|
        content = f.read
      end
    end
    content
  end

  # returns the stored content corresponding to +uri+ URI. In case there
  # isn't any file it returns nil.
  def read_uri(uri, filext=nil)
    filext = @file_ext unless filext
    pathname = @up.uri_to_pathname(uri,nil,filext)
    read_pathname(pathname)
  end

  private

  # creates +directory+ if it doesn't exist
  def mkdir_if_not_exists(directory)
    dir = File.expand_path(directory)
    FileUtils.mkdir_p(dir) unless (File.exist?(dir) and File.directory?(dir))
  end

end
