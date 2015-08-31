$(document).ready(function() {

// $('h1').fadeIn(4000);

    $.ajax({
      method: "GET",
      url: "/api/lddailies",
      dataType:'json',

      success: function(data) {
        function randQuote(data) {
          var all = data;
          console.log(all)

        // console.log(quote)
        // var source = data[num].source;
          $('#new-lddaily').on('click', function(){
            var num = Math.floor(Math.random() * (31)) + 1;
            var quote = all[num].quote;
            $('#ld-quote-list').html(quote + '<p>' + '<br>' + '<strong class="cursive">' + "- Larry David" + '</strong>' + '</p>');


          });
      }
      randQuote(data);
    }

  });

        // for (var i=0;i<31;i++) {
          // var quote = data.larry.event[i];

//name--------- spacing
var larrysays = larrysays || {};
var active = active || {};


// some blueprints
larrysays.model = Backbone.Model.extend();
larrysays.collection = Backbone.Collection.extend({
  model: larrysays.model,
  url: '/api/lddailies'
});

larrysays.modelView = Backbone.View.extend({
  initialize: function(){
    this.template = _.template($('#quotes-template').html());
    this.render();
  },
  render: function(){
    var data = this.model.attributes;
    this.$el.append(this.template(data));
  }
});

larrysays.collectionView = Backbone.View.extend({
  initialize: function() {
    var that = this;
    this.collection.on('sync', function(){
      //that.render();
      //not sure if i need this or not
    });
    this.collection.fetch();
    this.$el.html('');
    //keeps it random
  },
  //
  // render: function() {
  //     this.$el.html('');
  //     var collection = this.collection.models;
  //     var random = _.template(collection);
  //     new larrysays.modelView({
  //         el: $('#quote-list'),
  //         model: random
  //     });
  //   },
  });
});














// blueprints-- done
//
// $(document).ready(function(event) {
//     //instantiate collection + collectionView
//     active.collection = new larrysays.collection();
//     active.collectionView = new larrysays.collectionView({
//       collection: active.collection,
//       el: $('#quote-list')
//     });
// });
