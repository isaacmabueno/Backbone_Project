// $('document').ready(function(){
//
//
//   $.ajax({
//     method: "GET",
//     url: "/api/lddailies",
//     dataType:'json',
//
//     success: function(data) {
//       function randQuote(data) {
//       var num = Math.floor(Math.random() * (30)) + 1;
//       var quote = data[num].quote;
//       var source = data[num].source;
//         console.log(quote, "-" + source);
//     }
//     randQuote(data);
//
//
//       for (var i=0;i<30;i++) {
//         // var quote = data.larry.event[i];
//       }
//     }
//
//   });
// });


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

  render: function() {
      this.$el.html('');
      var collection = this.collection.models;
      var random = _.sample(collection);
      new larrysays.modelView({
          el: $('#ld-quote-list'),
          model: random
      });
    },
// blueprints-- done

$(document).ready(function(event) {
    //instantiate collection + collectionView
    active.collection = new larrysays.collection();
    active.collectionView = new larrysays.collectionView({
      collection: active.collection,
      el: $('#ld-quote-list')
    });
});
