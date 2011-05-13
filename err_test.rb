require 'rubygems'
require 'rubygems/gem_runner'
require 'rubygems/exceptions'

    def capture_output

      begin
        require 'stringio'
        $o_stdout, $o_stderr, $stdout, $stderr = $stdout, $stderr, StringIO.new, StringIO.new
        yield
        {:stdout => $stdout.string, :stderr => $stderr.string}
      ensure
        $stdout, $stderr = $o_stdout, $o_stderr
      end
    end


puts capture_output{Gem::GemRunner.new.run ["list"]}