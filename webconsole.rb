# -*- coding: utf-8 -*-
require 'rubygems'
require 'sinatra'
require 'keeptesting'

get '/' do
  "#{index}"
end

get '/latest-test-json' do
  require 'json'
  @result, @output = Keeptesting::BrowserConsole.retrieve_last_test_summary
  {:result => @result, :output => @output}.to_json
end

def index
  html = <<HTML
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Keeptesting</title>
  </head>
  <body>

    <style>
      .red {
      background-color: #FF3B3B;
      }
      .green {
      background-color: #3BFF3E;
      }
    </style>
    
    <h1>Keep testing!</h1>
    
    <div id="test-output">
       Waiting for first test result...
    <div>

<script>
#{jquery_js}
</script>

<script>
#{keeptesting_js}
</script>



  </body>
</html>

HTML
end

def keeptesting_js
  javascript = <<JAVASCRIPT
var showLastTest = function(){
  $.get("/latest-test-json", function(data) {
    var header = $("h1");
    var last_test = data;
    var test_output_div = $("#test-output");
    var body = $("body")
    var result = last_test.result;

    header.html(result);
    if(result.match(/success/)){
      body.removeClass("red").addClass("green");
    } else {
      body.removeClass("green").addClass("red");
    }

    var test_output = last_test.output;
    test_output_div.html("<pre>"+test_output+"</pre");
  }, "json");
};

$(document).ready(function(){
  setInterval(showLastTest, 300);
});
JAVASCRIPT
end

def jquery_js
  jquery_path = File.dirname(__FILE__) + '/./jquery.min.js'
  file = File.open(jquery_path, "rb")
  contents = file.read
end

