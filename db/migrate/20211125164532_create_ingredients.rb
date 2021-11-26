class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :title
      t.integer :recipe_id
      t.string :quantity

      t.timestamps
    end
  end
end
