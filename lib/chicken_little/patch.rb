module ChickenLittle

  Uncommented_Line = "deprecate :default_executable"
 
  class Patch
    extend Commandable
    
    command "Tries to fix your gems so they stop giving the deprication warning."
    def install
       
      (1..5).each do |i|
        output = capture_output{
          puts "Cleaning up gems, this will take a while. Go get some coffee..."
          case i
            when 1,4
              `gem pristine --all --no-extensions`
            else
              `gem pristine --all`
          end 
        }
        puts "stdout: \n#{output[:stdout]}\n\n"
        puts "stderr: \n#{output[:stderr]}\n"
        exit!
      end
      
    end
    
    command "Forces the old method for disabling the annoying deprication warnings", :xor
    def force_install
      describe_fix
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
    
    command "Desribe a better way to fix the problem"
    def describe_fix(force_description=false)
      flag_file = "#{File.expand_path(File.dirname(__FILE__))}/better_fix_described"
      unless File.exist?(flag_file) && !force_description
        FileUtils.touch flag_file
        puts %{
  Important! The old install method should not be necessary.

  A better fix is to run:
  $ gem pristine --all --no-extensions

  Then run this:
  $ gem pristine --all

  You may need to run those commands several times.

  Chicken Little is now running those methods for you. This will take a while.
  They will be run until the errors go away or it's tried too many times.
  
  If you still have problems you can then force the old install method with:
  $ chicken_little force_install
          
          }
          exit!
      end
    end

    private

    def capture_output
      begin
        require 'stringio'
        $o_stdout, $o_stderr = $stdout, $stderr
        $stdout, $stderr = StringIO.new, StringIO.new
        yield
        {:stdout => $stdout.string, :stderr => $stderr.string}
      ensure
        $stdout, $stderr = $o_stdout, $o_stderr
      end
    end

    
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
