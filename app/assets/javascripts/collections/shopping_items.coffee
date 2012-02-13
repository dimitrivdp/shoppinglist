class ShoppingListApp.Collections.ShoppingItems extends Backbone.Collection
  model: ShoppingListApp.Models.ShoppingItem, 
  url: '/shopping_items'
  
  comparator: (shopping_item )->
    return shopping_item.get("position");
    
  shoppingList: () ->
    shopping_items = @filter (shopping_item) ->
      shopping_item.isOnList() and ! shopping_item.isInCart()
