
// TODO wait til doc load to start
// TODO loop it



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
  setInterval(showLastTest, 1000);
});




