class CreateAccionEnSnapshots < ActiveRecord::Migration
  def change
    create_table :accion_en_snapshots do |t|
      t.integer :accion_id
      t.integer :snapshot_id
      t.integer :posicion
      t.integer :visitas_recientes
      t.integer :visitas_totales

      t.timestamps null: false
    end
  end
end
