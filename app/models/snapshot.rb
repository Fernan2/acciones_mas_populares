class Snapshot < ActiveRecord::Base
  has_many :accion_en_snapshots, -> { order(:posicion) }, dependent: :destroy

  def self.get_from_source
    require 'open-uri'
    JSON.load(open("http://localhost:3001/acciones_mas_populares.json"))
  end

  def self.get_from_other_instance(dominio, snapshot_id)
    require 'open-uri'
    JSON.load(open("#{dominio}/snapshots/#{snapshot_id}/accion_en_snapshots"))
  end

  def set_id_from_created_at
     self.id = created_at.strftime('%y%m%d%H%M')
     save!
  end
end
