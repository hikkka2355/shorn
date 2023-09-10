class AddImageToPixars < ActiveRecord::Migration[6.1]
  def change
    add_column :pixars, :image, :string
  end
end
