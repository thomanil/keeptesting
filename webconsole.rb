# -*- coding: utf-8 -*-
require 'rubygems'
require 'sinatra'
require 'keeptesting'

get '/' do
  erb :index
end

get '/latest-test-json' do
  require 'json'
  @result, @output = Keeptesting::BrowserConsole.retrieve_last_test_summary
  {:result => @result, :output => @output}.to_json
end
