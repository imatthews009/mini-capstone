class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :sports
      t.string :home
      t.string :computer

      t.timestamps
    end
  end
end
