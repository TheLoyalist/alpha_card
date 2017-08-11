module AlphaCard
  ##
  # AlphaCard gem version.
  def self.gem_version
    Gem::Version.new VERSION::STRING
  end

  ##
  # AlphaCard semantic versioning
  module VERSION
    # Major version number
    MAJOR = 0
    # Minor version number
    MINOR = 4
    # Smallest version number
    TINY  = 1

    # Full version number
    STRING = [MAJOR, MINOR, TINY].compact.join('.')
  end
end
