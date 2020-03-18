class CreateSceneries < ActiveRecord::Migration[5.2]
  def change
    create_table :sceneries do |t|
      t.string :name
      t.string :title, null: false
      t.text :body
      t.string :image
      t.string :place
      t.string :prefecture
      t.float :latitude
      t.float :longitude
      t.string :parking_select
      t.text :parking_description
      t.string :category

      t.timestamps
    end
  end
end
