# -*- encoding: utf-8 -*-

module Keeptesting
  module Common
    
    def self.test_success?(test_output, failure_regex)
      true unless test_output =~ /#{failure_regex}/
    end

  end
end
