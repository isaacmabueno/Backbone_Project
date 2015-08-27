var ld_everyday = ld_everyday || {};
ld_everyday.blueprints = ld_everyday.blueprints || {};
ld_everyday.active = ld_everyday.active || {};

ld_everyday.blueprints.model = Backbone.Model.extend({
  initialize: function() {
    consoel.log('a model is ready');
  }
});
ld_everyday.blueprints.collection = Backbone.Collection.extend({
  url: '/api/lddailies'
})
