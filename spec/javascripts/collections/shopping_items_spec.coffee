describe "ShoppingListApp.Collections.ShoppingItems", ->
  it "contains instances of ShoppingListApp.Models.ShoppingItem", ->
    collection = new ShoppingListApp.Collections.ShoppingItems()
    expect(collection.model).toEqual(ShoppingListApp.Models.ShoppingItem)

  it "is persisted at /shopping_items", ->
    collection = new ShoppingListApp.Collections.ShoppingItems()
    expect(collection.url).toEqual("/shopping_items")

  describe "#shoppingList", ->
    beforeEach ->
      @collection = new ShoppingListApp.Collections.ShoppingItems(@fixtures.ShoppingItems.shopping_list)
    
    describe "it contains the necessary items that are on the list and not in the cart", ->
      it "contains the correct number", ->
        expect(@collection.shoppingList().length).toEqual(2)
      it "contains item with id 1", ->
        expect(@collection.shoppingList()).toContain(@collection.get(1))
      it "contains item with id 2", ->
        expect(@collection.shoppingList()).toContain(@collection.get(2))
        
    describe "does not contains the shopping items that are not on the list and in the cart", ->
      it "doesn't contain item with id 3", ->
        expect(@collection.shoppingList()).not.toContain(@collection.get(3))
      it "doesn't contain item with id 4", ->
        expect(@collection.shoppingList()).not.toContain(@collection.get(4))
      it "doesn't contain item with id 5", ->
        expect(@collection.shoppingList()).not.toContain(@collection.get(5))
        