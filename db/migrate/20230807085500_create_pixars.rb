class CreatePixars < ActiveRecord::Migration[6.1]
  def change
    create_table :pixars do |t|
      t.string :name
      t.text :main
      t.text :mouse
      t.string :movie

      t.timestamps
    end
  end
end
