# -*- encoding: utf-8 -*-

module Keeptesting
  module CLI
        
    def self.testrun(options)
      puts `clear`
      puts "RUNNING TESTS..."
      
      cmd = options[:test_command]
      test_output = `#{cmd}`
      test_succeded = Keeptesting::Common::test_success?(test_output, options[:failure_regex])
      puts `clear`
      if test_succeded
        puts "SUCCESS!\n\n\n"
      else
        puts "FAILURE!\n\n\n"
      end

      puts test_output
    end 

    def self.start_test_loop(options)
      Keeptesting::CLI::testrun(options)
      FSSM.monitor('.', '**/*') do
        update {|base, relative| Keeptesting::CLI::testrun(options)}
        delete {|base, relative| Keeptesting::CLI::testrun(options)}
        create {|base, relative| Keeptesting::CLI::testrun(options)}
      end
    end
  end
end
