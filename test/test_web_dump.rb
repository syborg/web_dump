require 'test/unit'
require 'web_dump'
require 'fileutils'

class TC_WebDump < Test::Unit::TestCase

  TEST_DIR = '~/tmp/web_dump'

  # called before every test
  def setup
    FileUtils.remove_dir(File.expand_path(TEST_DIR), true)
    @wd = WebDump.new :base_dir => TEST_DIR
  end

  # called after every test
  def teardown
    FileUtils.remove_dir(File.expand_path(TEST_DIR), true)
  end

  def test_automatic_dir_and_file_creation
    wd = WebDump.new :base_dir => TEST_DIR, :host_sep => '/'
    pathname = wd.save 'http://www.fake.fak/fakpath', 'Hello World!'
    assert(File.exist?(pathname))
  end

  def test_raw_file_sr_cycle
    input = 'Hello World!'
    uri = 'http://www.com/prova'
    pathname = @wd.save(uri,input)
    output = @wd.read_pathname(pathname)
    assert_equal input, output, "retrieved through pathname"
    output = @wd.read_uri(uri)
    assert_equal input, output, "retrieved through uri"
  end

  def test_gzipped_file_sr_cycle
    input = 'Hello World!'
    uri = 'http://www.com/prova'
    pathname = @wd.save(uri,input,".gz")
    output = @wd.read_pathname(pathname)
    assert_equal input, output, "retrieved through pathname"
    output = @wd.read_uri(uri,"gz")
    assert_equal input, output, "retrieved through uri"
  end


end
