# -*- coding: utf-8 -*-
require 'rubygems'
require 'sinatra'
require 'keeptesting'

get '/' do
  erb :index
end

get '/latest-test' do
  @result, @output = Keeptesting::BrowserConsole.retrieve_last_test_summary
  erb :latest_test, :layout => false
end
