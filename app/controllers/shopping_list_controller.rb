class ShoppingListController < ApplicationController
  def index
    @shopping_items = ShoppingItem.all
  end
end
