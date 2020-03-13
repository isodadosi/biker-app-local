class CreateShopCategoryRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_category_relations do |t|
      t.references :shop, foreign_key: true, type: :integer
      t.references :category, foreign_key: true, type: :integer

      t.timestamps
    end
  end
end
