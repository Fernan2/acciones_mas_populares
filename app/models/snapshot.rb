class Snapshot < ActiveRecord::Base
  has_many :accion_en_snapshots, -> { order(:posicion) }, dependent: :destroy

  def self.get_from_source
    require 'open-uri'
    JSON.load(open("http://localhost:3001/acciones_mas_populares.json"))
  end
end
