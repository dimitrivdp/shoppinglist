class ShoppingListApp.Views.ShoppingItemsNew extends Backbone.View
  tagName: "form"
  id:      "new-shopping_item"
  
  events:
    "submit": "save"
    "click a.leave": "leave"

  initialize: ->
    _.bindAll(this, "render", "saved")
    this.newShoppingItem();
    
  newShoppingItem: ->
    @model = new ShoppingListApp.Models.ShoppingItem()
    @form = new Backbone.Form( model: @model )

  render: ->
    $(this.el).html(@form.render().el)
    this.$('ul').append(JST['shopping_items/form_buttons']())
    return this

  renderFlash: (flashText) ->
    $(this.el).prepend(JST['shopping_items/flash']( flashText: flashText, type: 'success' ))

  save:  ->
    @form.commit()
    @model.save({}, { success: this.saved })
    return false

  saved: ->
    flash = "The shopping item " + @model.escape('name') + " has been added."
    @collection.add(@model)
    this.newShoppingItem()
    this.render()
    this.renderFlash(flash)

  leave: ->
    this.unbind()
    this.remove()
    