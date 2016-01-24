class WebController < ApplicationController
  
  def index
    @snapshots = Snapshot.order(created_at: :desc)
    @acciones = Accion.order(:nombre)
  end
end
