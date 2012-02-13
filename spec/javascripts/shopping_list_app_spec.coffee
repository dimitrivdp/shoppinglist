describe "ShoppingListApp", ->
  it "has a namespace for Models", ->
    expect(ShoppingListApp.Models).toBeTruthy()
    
  it "has a namespace for Collections", ->
    expect(ShoppingListApp.Collections).toBeTruthy()

  it "has a namespace for Views", ->
    expect(ShoppingListApp.Views).toBeTruthy()

  it "has a namespace for Routers", ->
    expect(ShoppingListApp.Routers).toBeTruthy()
  
  it "has a namespace for Helpers", ->
    expect(ShoppingListApp.Helpers).toBeTruthy()
  
  describe "init()", ->
    it "accepts shopping_list JSON and instantiates a collection from it", ->
      shopping_items_json = [{"name":"Milk", "position":0 }, {"name":"Eggs", "position":1}]
      ShoppingListApp.init {"shopping_items": shopping_items_json}
    
      expect(ShoppingListApp.shopping_items ).not.toEqual(undefined)
      expect(ShoppingListApp.shopping_items.length).toEqual(2)
      expect(ShoppingListApp.shopping_items.models[0].get('name')).toEqual("Milk")
      expect(ShoppingListApp.shopping_items.models[1].get('name')).toEqual("Eggs")
        
    it "instantiates a ShoppingListApp router", ->
      expect(ShoppingListApp.Routers.ShoppingList).toBeTruthy()

    it "starts Backbone.history", ->
       ShoppingListApp.init()
       expect(Backbone.history.started).toBeTruthy()