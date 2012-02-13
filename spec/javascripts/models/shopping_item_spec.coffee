describe "ShoppingListApp.Models.ShoppingItem", ->
  it "is persisted at /shopping_items", ->
    shopping_item = new ShoppingListApp.Models.ShoppingItem()
    expect(shopping_item.urlRoot).toEqual("/shopping_items")
  
  describe "#isOnList", ->
    it "calculates true for is_on_list = true", ->
      shopping_item = new ShoppingListApp.Models.ShoppingItem({ name:"Milk", id:1, is_on_list: true, position:1 })
      expect(shopping_item.isOnList()).toBeTruthy()
    it "calculates false for is_on_list = false", ->
      shopping_item = new ShoppingListApp.Models.ShoppingItem({ name:"Milk", id:1, is_on_list: false, position:1 })
      expect(shopping_item.isOnList()).toBeFalsy()
      
  describe "#inCart", ->
    it "calculates true for has_been_bought = true", ->
      shopping_item = new ShoppingListApp.Models.ShoppingItem({ name:"Milk", id:1, has_been_bought: true, position:1 })
      expect(shopping_item.isInCart()).toBeTruthy()
    it "calculates false for has_been_bought = false", ->
      shopping_item = new ShoppingListApp.Models.ShoppingItem({ name:"Milk", id:1, has_been_bought: false, position:1 })
      expect(shopping_item.isInCart()).toBeFalsy()
      
