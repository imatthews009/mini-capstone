class RemoveColumnFromCatagories < ActiveRecord::Migration[5.1]
  def change
    remove_column :categories, :sports, :string
    remove_column :categories, :home, :string
    remove_column :categories, :computer, :string
    add_column :categories, :title, :string
  end
end
