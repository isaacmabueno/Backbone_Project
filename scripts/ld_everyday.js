

// var larrydavid = larrydavid || {};
// larrydavid.blueprints = larrydavid.blueprints || {};
// larrydavid.active = larrydavid.active || {};
// //blueprints for models and collections
//
// //this works!
// larrydavid.blueprints.model = Backbone.Model.extend({
//   initialize: function() {
//     console.log('a LD Daily model is ready');
//   }
// });
//
// //this also works!!!! Hallelujiah
// larrydavid.blueprints.collection = Backbone.Collection.extend({
//   url: '/api/lddailies',
//   model: larrydavid.blueprints.model,
//   initialize: function() {
//     console.log('a Larry David collection is ready');
//     //first fetch once this is loaded!
//     this.fetch();
//     this.on('change', function() {
//       //this keeps my collection up to date with the server
//       this.fetch();
//     });
//   }
// });
//
// //CRUD- create
// // larrydavid.create = function(quote, source) {
// //   if (!quote || !source) {
// //     console.log('you are missing a paramter! oopsie');
// //     return false;
// //   }
// //   larrydavid.active.quotesCollection.create({
// //     quote: quote,
// //     source: source
// //   });
// //   return true;
// // };
//
//
// //blueprints for views
// //ourcollection view---- this is the * in MV*
//
//
// larrydavid.blueprints.collectionView = Backbone.View.extend({
//   initialize: function() {
//     this.$el = $('.quotes')
//     //render it!
//     this.render();
//     var that=this;
//     this.collection.on('sync', function() {
//       that.render();
//     });
//   },
//   render: function() {
//     this.$el.html('');
//     var models = this.collection.models;
//     for (var m in models) {
//       var data = models[m];
//       new larrydavid.blueprints.modelView({
//         model: data
//       });
//     }
//   }
// });
// larrydavid.blueprints.modelView = Backbone.View.extend({
//   initialize: function() {
//     this.$el = $('.quotes');
//     this.sample = _.sample($('#table-row-template').html());
//     this.render();
//   },
//   render: function() {
//     var data = this.model.attributes;
//     this.$el.append(this.sample(data));
//   }
// });
// //events/triggers/ all the gizmos and gadgets.....
// $(document).ready(function(){
//   larrydavid.active.quotesCollection = new larrydavid.blueprints.collection();
//   larrydavid.active.quotesCollection = new larrydavid.blueprints.collectionView();
//     collection: larrydavid.active.quotesCollection
//   });
//
//   $('#new-lddaily').on('click', function(){
//     larrydavid.active.quotesCollection.fetch();
//     });
