class AddUserIdToPixars < ActiveRecord::Migration[6.1]
  def change
    add_column :pixars, :user_id, :integer
  end
end
