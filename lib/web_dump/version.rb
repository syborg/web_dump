# it's only a version number

class WebDump

  module Version

    MAJOR = 0
    MINOR = 0
    PATCH = 2
    BUILD = 0
	
    STRING = [MAJOR, MINOR, PATCH, BUILD].compact.join(".")

  end

end
