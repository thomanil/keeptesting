# -*- encoding: utf-8 -*-

module Keeptesting
  
  require "fileutils"
  require "rubygems"
  require "yaml"
  
  class BrowserConsole

    def initialize(options={})
      watch_files(options)
      start_console
    end
    
    RESULT_FILE_PATH = "/tmp/keeptesting-state.txt"

    def store_running_status
      File.open RESULT_FILE_PATH, "w" do |filebody|
          filebody.write("Running\n")
      end
    end

    def store_last_test_summary(success, output)
      File.open RESULT_FILE_PATH, "w" do |filebody|
        if success
          filebody.write("Success\n")
        else
          filebody.write("Failure\n")
        end
        filebody.write(output)
      end
    end

    def self.retrieve_last_test_summary
      file = File.open(RESULT_FILE_PATH, "rb")
      contents = file.read

      result = contents.lines.first
      output = contents.lines.to_a[1..-1].join("\n")
      
      return result, output
    end
    
    def testrun(options)
      store_running_status
      cmd = options[:test_command]
      test_output = `#{cmd} 2>&1`
      test_succeeded = Keeptesting::Common::test_success?(test_output, options[:failure_regex])
      store_last_test_summary(test_succeeded, test_output)
    end
      
    def watch_files(options)
      Thread.new do
        console = self
        console.testrun(options)
        FSSM.monitor do
          options[:watched_paths].each do |watched_path|
            path watched_path do
              update {|base, relative| console.testrun(options)}
              delete {|base, relative| console.testrun(options)}
              create {|base, relative| console.testrun(options)}
            end
          end
        end
      end
    end

    def start_console      
      webconsole_path = File.dirname(__FILE__) + '/../../webconsole.rb'
      puts "\n\n\nWeb console starting up, goto http://localhost:5000\n\n\n"
      puts `ruby #{webconsole_path} -e development -p 5000`
    end
   
  end
end
