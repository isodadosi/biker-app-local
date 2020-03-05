class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :title
      t.text :body
      t.string :image
      t.string :prefecture
      t.string :place
      t.float :latitude
      t.float :longitude
      t.integer :parking_rank
      t.string :parking_select
      t.text :parking_description

      t.timestamps
    end
  end
end
