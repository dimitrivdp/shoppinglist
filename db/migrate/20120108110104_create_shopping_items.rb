class CreateShoppingItems < ActiveRecord::Migration
  def change
    create_table :shopping_items do |t|
      t.string :name
      t.boolean :is_on_list         , :default => false
      t.boolean :has_been_bought    , :default => false
      t.integer :position

      t.timestamps
    end
  end
end
