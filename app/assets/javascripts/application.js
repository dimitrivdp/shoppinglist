// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.

//= require jquery
//= require jquery-ui
//= require jquery_ujs
//
//= require underscore
//= require backbone
//
//= require backbone-forms.js
//= require jquery-ui-editors.js
//
//= require pusher.min.js
//= require backpusher.js
//
// this one MUST be required after the backpusher one, because they both change the Backbone.sync method
//= require backbone.authtokenadapter
//
//= require shopping_list_app
//
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require_tree ./routers
//= require_tree ../templates
//= require_tree .