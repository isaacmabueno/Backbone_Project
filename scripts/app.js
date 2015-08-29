$('document').ready(function(){


  $.ajax({
    method: "GET",
    url: "/api/lddailies",
    dataType:'json',

    success: function(data) {
      function randQuote(data) {
      var num = Math.floor(Math.random() * (30)) + 1;
      var quote = data[num].quote;
      var source = data[num].source;
        console.log(quote, "-" + source);
    }
    randQuote(data);


      for (var i=0;i<30;i++) {
        // var quote = data.larry.event[i];
      }
    }

  });
});
