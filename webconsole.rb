# -*- coding: utf-8 -*-
require 'rubygems'
require 'sinatra'
require 'keeptesting'

get '/' do
  console = Keeptesting::BrowserConsole.new
  @result, @output = console.retrieve_last_test_summary
  
  erb :index
end

get '/latest-test' do
  erb :latest_test, :layout => false
end
