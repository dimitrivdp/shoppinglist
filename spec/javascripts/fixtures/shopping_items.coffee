beforeEach ->
  @fixtures =
    ShoppingItems:
      shopping_list: [
          { id: 1 , name:"Milk"           , has_been_bought: false,  is_on_list: true  } # on list
          { id: 2 , name:"Eggs"           , has_been_bought: false,  is_on_list: true  } # on list
          { id: 3 , name:"Beer"           , has_been_bought: false,  is_on_list: false }
          { id: 4 , name:"Bread"          , has_been_bought: true,  is_on_list: true   }
          { id: 5 , name:"Choco"          , has_been_bought: true,  is_on_list: false  }
        ]
