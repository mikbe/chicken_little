module ChickenLittle
  
  class GemFileNotFound < StandardError
    def initialize(msg = "I couldn't figure out where to start looking for the RubyGems install.")
      super(msg)
    end
  end
  
  class SpecFileNotFound < StandardError
    def initialize(msg = "Could not find specification.rb file")
      super(msg)
    end
  end
  
  class SpecFileNotWritable < StandardError
    def initialize(msg = "You do not have permission to write to the specification.rb file.\nTry running using the sudo command: sudo chiken_little [option]")
      super(msg)
    end
  end

end
