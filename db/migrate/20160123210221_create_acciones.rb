class CreateAcciones < ActiveRecord::Migration
  def change
    create_table :acciones do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
