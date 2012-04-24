# -*- coding: utf-8 -*-
require 'rubygems'
require 'sinatra'
require 'keeptesting'
require 'json'

get '/' do
  html_path = File.dirname(__FILE__) + '/webconsole.html'
  file = File.open(html_path, "rb")
  markup = file.read
end

get '/latest-test-json' do
  @result, @output = Keeptesting::BrowserConsole.retrieve_last_test_summary
  {:result => @result, :output => @output}.to_json
end
