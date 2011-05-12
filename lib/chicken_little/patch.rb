module ChickenLittle

  Uncommented_Line = "deprecate :default_executable"
 
  class Patch
    extend Commandable
    
    command "Disables the annoying deprication warnings from the gem command", :default, :xor
    def install
      supported?
      return "Chicken Little is already installed" if installed?
      new_spec_file = spec_file_contents.collect { |line| line.index(Uncommented_Line) ? "##{line.strip}\n" : line}
      save_spec_file(new_spec_file)
      if installed?
        "Chicken Little installed successfully."
      else
        "Install failed. No idea why."
      end
    end
    
    command "Removes the Chicken Little patch", :xor
    def uninstall
      supported?
      return "Chicken Little isn't installed" unless installed?
      new_spec_file = spec_file_contents.collect { |line| line.index(Uncommented_Line) ? line.delete("#") : line}
      save_spec_file(new_spec_file)
      unless installed?
        "Chicken Little uninstalled successfully."
      else
        "Uninstall failed. No idea why."
      end
    end
    
    command "Checks to see if Chicken Little is already installed", :xor
    def installed?
      spec_file_contents.select { |line| line.strip.start_with?(Uncommented_Line) }.empty?
    end

    command "Lets you know if it can be installed"
    def supported?
      raise ChickenLittle::GemFileNotFound unless gem_file_found?
      raise ChickenLittle::SpecFileNotFound unless spec_file_found?
      raise ChickenLittle::SpecFileNotWritable unless spec_file_writable?
      "Looks good. Chicken Little can find and modify the necessary files."
    end
    
    private
    
    def gem_file_path
      @gem_file ||= `which gem`.chomp
      @gem_file_path ||= File.symlink?(@gem_file) ? File.readlink(@gem_file) : @gem_file
    end
    
    def spec_file_path
      @spec_file_path ||= File.expand_path(gem_file_path + "/../../lib/ruby/site_ruby/1.9.1/rubygems/specification.rb")
    end

    def spec_file_contents
      File.readlines(spec_file_path)
    end
    
    def gem_file_found?
      File.exist?(gem_file_path)
    end
    
    def spec_file_found?
      File.exist?(spec_file_path)
    end
    
    def spec_file_writable?
      File.writable?(spec_file_path)
    end
    
    def save_spec_file(spec_file_lines)
      File.open(spec_file_path, "w") do |file|
        spec_file_lines.each {|line| file.write(line)}
       end
    end
    
  end

end
