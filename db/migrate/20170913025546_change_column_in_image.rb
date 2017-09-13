class ChangeColumnInImage < ActiveRecord::Migration[5.1]
  def change
    rename_column :images, :supplier_id, :product_id
  end
end
