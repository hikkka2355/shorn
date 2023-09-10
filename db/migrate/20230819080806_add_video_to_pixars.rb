class AddVideoToPixars < ActiveRecord::Migration[6.1]
  def change
    add_column :pixars, :video, :string
  end
end
