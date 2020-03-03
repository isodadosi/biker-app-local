class ChangeColumnToContent < ActiveRecord::Migration[5.2]
  def change
    change_column :contents, :body, :text, :limit => 65535
  end
end
