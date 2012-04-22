# -*- encoding: utf-8 -*-

module Keeptesting
  module CLI

    GREEN_TEXT="\033[32m"
    YELLOW_TEXT="\033[33m"
    RED_TEXT="\033[31m"
    RESET_TEXT="\033[0m"

    
    def self.testrun(options)
      puts `clear`
      puts "#{YELLOW_TEXT}RUNNING TESTS...#{RESET_TEXT}"
      
      cmd = options[:test_command]
      test_output = `#{cmd} 2>&1`
      test_succeded = Keeptesting::Common::test_success?(test_output, options[:failure_regex])
      puts `clear`
      if test_succeded
        puts "#{GREEN_TEXT}SUCCESS!#{RESET_TEXT}\n\n\n"
      else
        puts "#{RED_TEXT}FAILURE!#{RESET_TEXT}\n\n\n"
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
