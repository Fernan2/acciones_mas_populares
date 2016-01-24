class SnapshotsController < ApplicationController
  def new
    @datos = Snapshot.get_from_source
  end

  def create
    fecha = Time.current.beginning_of_minute
    snapshot = Snapshot.create(created_at: fecha)
    snapshot.set_id_from_created_at
    datos = Snapshot.get_from_source
    datos.each_with_index { |dato, i| snapshot.accion_en_snapshots << AccionEnSnapshot.crear_desde_dato(dato, i) }

    redirect_to snapshot_path(snapshot)
  end

  def show
    @snapshot = Snapshot.find(params[:id])
  end

  def destroy
    Snapshot.find(params[:id]).destroy
    redirect_to root_path
  end

  def index
    render text: Snapshot.order(:id).pluck(:id).join(',')
  end
end
