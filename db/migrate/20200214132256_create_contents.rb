class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :place
      t.text :body
      t.string :image
      t.string :prefecture
      t.float :latitude , default: '35.681167'
      t.float :longitude, default: '139.767052'
      t.string :name

      t.timestamps
    end
  end
end
