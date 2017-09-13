class AddSupplierIdToImage < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :supplier_id, :integer
  end
end
