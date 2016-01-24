class AccionEnSnapshotsController < ApplicationController
  def index
    snapshot = Snapshot.find(params[:snapshot_id])
    accion_en_snapshots = snapshot.accion_en_snapshots.con_nombre_accion

    render text: accion_en_snapshots.to_json
  end
end
