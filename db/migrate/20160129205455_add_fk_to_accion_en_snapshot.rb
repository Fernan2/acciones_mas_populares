class AddFkToAccionEnSnapshot < ActiveRecord::Migration
  def up
    add_foreign_key :accion_en_snapshots, :snapshots, on_update: :cascade
  end

  def down
    remove_foreign_key :accion_en_snapshots, :snapshots
  end
end
