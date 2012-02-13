class ShoppingListApp.Views.ShoppingItemItem extends Backbone.View
  className: "list resource_row"

  events:
    "change input#in_cart": "update_in_cart"
    "change input#on_list": "update_on_list"
    "click a.destroy"     : "destroyShoppingItem"
    "click a.move"        : "startMovingItem"
    "click a.target"      : "moveItemBefore"

  initialize: () ->
    _.bindAll(this, "render", "renderFormContents" )
    @model.bind("change", this.renderFormContents, @)
    @status = "target"

  render: () ->
    $(@el).html(JST['shopping_items/item']({ shopping_item: @model }))
    @renderFormContents()
    @renderMoveButton()
    @

  renderFormContents: () ->
    this.$('#name').html(@model.get('name'))   
    this.$('input#in_cart').prop("checked", @model.isInCart())    
    this.$('input#on_list').prop("checked", @model.isOnList())
  
  renderMoveButton: () ->
    #
    if @status == 'move' 
      this.$('.move').show()
    else
      this.$('.move').hide()
    #
    if @status == "move_before" or @status == "move_after"
      this.$('.target').show()
      this.$('.target').html('before') if @status == "move_before"
      this.$('.target').html('after') if @status == "move_after"
    else
      this.$('.target').hide()
    #
    if @status == 'moving' 
      this.$('.moving').show()
    else
      this.$('.moving').hide()
  
  destroyShoppingItem: ->
    this.model.destroy()
  
  update_in_cart: () ->
    has_been_bought = this.$('input#in_cart').prop('checked')
    this.model.save( has_been_bought: has_been_bought )
  
  update_on_list: () ->
    is_on_list = this.$('input#on_list').prop('checked')
    this.model.save( is_on_list: is_on_list )
    
  startMovingItem:() ->
    @model.collection.trigger("move",@model)
    console.log("startMoving", @model)
  
  moveItemBefore:() ->
    @model.collection.trigger("moveBefore",@model)
    console.log("moveBefore", @model)
    
  indicateAs: (status) -> 
    console.log('indicateAs'+status)
    @status = status
    this.renderMoveButton() 