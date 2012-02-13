Shoppinglist::Application.routes.draw do
  resources :shopping_items do
    member do
      post 'insert'
    end
  end

  root :to => 'shopping_list#index'
end
