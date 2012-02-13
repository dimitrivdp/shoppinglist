this.ShoppingListApp =
  Models:      {},
  Collections: {},
  Views:       {},
  Routers:     {},
  Helpers:     {},
  init:        (data) ->
    @pusher = new Pusher('a5aaf4ad03f7d2526b1c')
    @env = $("meta[name='env']").attr('content')
    @channel = @pusher.subscribe('shopping_items-'+@env)
    @shopping_items = new ShoppingListApp.Collections.ShoppingItems(data?.shopping_items)
    this.TodosBackpusher = new Backpusher(@channel, @shopping_items)
    new ShoppingListApp.Routers.ShoppingList()
    if !Backbone.history.started
      Backbone.history.start()
      Backbone.history.started = true