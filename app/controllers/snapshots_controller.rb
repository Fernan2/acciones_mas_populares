class SnapshotsController < ApplicationController
  require 'open-uri'

  def new
    @datos = Snapshot.get_from_source
  end

  def create
    fecha = Time.current.beginning_of_minute
    snapshot = Snapshot.create(created_at: fecha)
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
end
