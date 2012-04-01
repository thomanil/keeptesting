# -*- encoding: utf-8 -*-

module Keeptesting
  
  require "fileutils"
  require "rubygems"
  require "yaml"
  
  class BrowserConsole

    def initialize(options={})
      #watch_tests_in_other_thread(options)
      start_console
    end
    
    RESULT_FILE_PATH = "/tmp/keeptesting-state.txt"
    
    def store_last_test_summary(result, output)
      File.open RESULT_FILE_PATH, "w" do |filebody|
        filebody.write("#{result.to_s}\n")
        filebody.write(output)
      end
    end

    def retrieve_last_test_summary
      result = false
      output = ""
      File.open RESULT_FILE_PATH, "r" do |filebody|
        result = filebody.lines.first
        output = filebody.to_s
      end
      return result, output
    end
    
    def testrun(options)
      cmd = options[:test_command]
      test_output = `#{cmd}`
      test_succeeded = Keeptesting::Common::test_success?(test_output, options[:failure_regex])
      store_last_test_summary(test_succeeded, test_output)
    end

    def watch_tests_in_other_thread(options)
      puts "Starting test loop"
      #Thread.new do
      console = self
      FSSM.monitor('.', '**/*') do
        update {|base, relative| console.testrun(options)}
        delete {|base, relative| console.testrun(options)}
        create {|base, relative| console.testrun(options)}
      end
      #end
    end

    def start_console
      puts "keeptesting web console starting - goto http://localhost:5000"
      puts "---"
      puts `ruby -Ilib webconsole.rb -p 5000`
    end
   
  end
end
