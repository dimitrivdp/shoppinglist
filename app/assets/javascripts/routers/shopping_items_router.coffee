class ShoppingListApp.Routers.ShoppingList extends Backbone.Router
  initialize: -> 
    this.collection = ShoppingListApp.shopping_items
    
  routes:
    "":                                "index"
    "new":                             "newShoppingItem"
  
  index: -> 
    view = new ShoppingListApp.Views.ShoppingItemsIndex( collection: this.collection )
    $('#shopping_items').html(view.render().el)
  
  newShoppingItem: ->
    view = new ShoppingListApp.Views.ShoppingItemsNew( collection: this.collection )
    $('#shopping_items').html(view.render().el)
    