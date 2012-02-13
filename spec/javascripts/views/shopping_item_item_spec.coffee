describe "ShoppingListApp.Views.ShoppingItemItem", ->
  shopping_item = null
  view  = null
  
  beforeEach ->
    shopping_item = new ShoppingListApp.Models.ShoppingItem({ name:"Milk", id:1, position:1 })
    view = new ShoppingListApp.Views.ShoppingItemItem({ model: shopping_item })

  describe "renders an individual shopping_item", ->
    it "renders the name", ->
      $el = $(view.render().el)
      expect($el).toHaveText(/Milk/)
    describe "renders the on list check_box", ->
      it "renders the true value", ->
        shopping_item.set(is_on_list: true)
        $el = $(view.render().el)
        expect($el).toHaveText(/on list/)
        expect($el.find("input[id=on_list]")).toBeChecked()
      it "renders the false value", ->
        shopping_item.set(is_on_list: false)
        $el = $(view.render().el)
        expect($el).toHaveText(/on list/)
        expect($el.find("input[id=on_list]")).not.toBeChecked()
    describe "renders the has been bought check_box", ->
      it "renders the true value", ->
        shopping_item.set(has_been_bought: true)
        $el = $(view.render().el)
        expect($el).toHaveText(/on list/)
        expect($el.find("input[id=in_cart]")).toBeChecked()
      it "renders the false value", ->
        shopping_item.set(has_been_bought: false)
        $el = $(view.render().el)
        expect($el).toHaveText(/on list/)
        expect($el.find("input[id=in_cart]")).not.toBeChecked()
        