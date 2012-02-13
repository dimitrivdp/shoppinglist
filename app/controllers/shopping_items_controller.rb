class ShoppingItemsController < ApplicationController  
  respond_to :html, :json
    
  def index
    respond_with(@shopping_items = ShoppingItem.order("position asc").all)
  end

  def show
    @shopping_item = ShoppingItem.find(params[:id])
  end

  def new
    respond_with(@shopping_item = ShoppingItem.new)
  end
  
  def create
    if shopping_item = ShoppingItem.create(params[:shopping_item])
      Pusher[channel_name].trigger('created', shopping_item.attributes, params[:socket_id])
    end
    
    respond_with(shopping_item)
  end
  
  def edit
    respond_with(@shopping_item = ShoppingItem.find(params[:id]))
  end

  def update
    shopping_item = ShoppingItem.find(params[:id])
    if shopping_item.update_attributes(params[:shopping_item])
      Pusher[channel_name].trigger('updated', shopping_item.attributes, params[:socket_id])
    end
    
    respond_with(shopping_item)
  end
  
  def destroy
    @shopping_item = ShoppingItem.find(params[:id])
    @shopping_item.destroy
      
    Pusher[channel_name].trigger('destroyed', {:id => params[:id]}, params[:socket_id])

    respond_with(@shopping_item)
  end
  
  def insert
    @shopping_item = ShoppingItem.find(params[:id])
    if @shopping_item.insert_at params[:at]
      Pusher[channel_name].trigger('messed', {:id => params[:id], :at => params[:at]}, params[:socket_id])
    end
    respond_with(@shopping_item)
  end
  
  private
  
  def channel_name
    @channel_name ||= "shopping_items-#{Rails.env}"
  end
  
end
