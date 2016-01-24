class SnapshotImporterController < ApplicationController
  include HTTParty

  def establecer_origen
  end

  def pide_lista_snapshots
    @dominio = params[:dominio]
    url = "#{@dominio}/snapshots.json"
    response = HTTParty.get(url)
    @snapshots = response.body.split(',')
  end

  def importa_snapshot
    snapshot_id = params[:snapshot]
    snapshot = Snapshot.find_by(id: snapshot_id)
    unless snapshot
      snapshot = Snapshot.create(created_at: id_to_date(snapshot_id))
      snapshot.set_id_from_created_at
      datos = Snapshot.get_from_other_instance(params[:dominio], snapshot_id)
      datos.each_with_index { |dato, i| snapshot.accion_en_snapshots << AccionEnSnapshot.crear_desde_dato(dato, i) }
    end
    redirect_to snapshot_path(snapshot)
  end
end
