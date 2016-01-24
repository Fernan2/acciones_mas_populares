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
end
