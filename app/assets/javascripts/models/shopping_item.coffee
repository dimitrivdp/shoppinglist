class ShoppingListApp.Models.ShoppingItem extends Backbone.Model
  urlRoot: '/shopping_items'
  
  schema:
    name:
      type: "Text"
    is_on_list:
      type: "Checkbox"
      title: "Is on List"

  isOnList: -> 
    @get('is_on_list')
  
  isInCart: -> 
    @get('has_been_bought')  