class ShoppingListApp.Views.ShoppingItemsIndex extends Backbone.View
  initialize: () ->
    _.bindAll(this, "render", "startMove", "moveBefore", "afterMove" )
    this.collection.bind("add", this.render)
    this.collection.bind("reset", this.render)
    this.collection.bind("remove", this.render)
    this.collection.bind("move", this.startMove)
    this.collection.bind("moveBefore", this.moveBefore)
    
        
  render: () ->
    this.renderTemplate()
    this.renderTasks()
    return this

  renderTemplate: () ->
    $(this.el).html(JST['shopping_items/index']( shopping_items: this.collection ))

  renderTasks: () ->
    self = this
    before_shopping_item_in_motion = true
    this.collection.each(
      (shopping_item) ->
        status = "move"
        if (self.shopping_item_in_motion)
          if self.shopping_item_in_motion == shopping_item
            status = "moving"
            before_shopping_item_in_motion = false
          else
            if before_shopping_item_in_motion
              status = "move_before"
            else
              status = "move_after"
        console.log('shopping_item '+shopping_item.get('name')+' status:'+status)
        row = new ShoppingListApp.Views.ShoppingItemItem( model: shopping_item )
        row.indicateAs( status )
        self.$('.resource_table').append(row.render().el)
      )
      
  startMove: (moving_shopping_item) ->
    console.log("start move", moving_shopping_item)
    @shopping_item_in_motion = moving_shopping_item
    this.render()
    
  moveBefore: (move_before_shopping_item) ->
    console.log("move before", move_before_shopping_item)
    # move item on server
    id = @shopping_item_in_motion.get('id')
    at = move_before_shopping_item.get('position')
    $.post("shopping_items/"+id+"/insert.json","at="+at, this.afterMove)
  
  afterMove: (data, success, xhr) ->
    console.log ("SUKSES!")
    
    # reset move mode
    @shopping_item_in_motion = null  
     
    # get new order from server
    this.collection.fetch()
    
  