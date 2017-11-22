class AddIndexToBrand < ActiveRecord::Migration[5.1]
  def change

    add_index :brands, :name, unique: true
  end
end
