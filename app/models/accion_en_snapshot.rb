class AccionEnSnapshot < ActiveRecord::Base
  belongs_to :accion
  belongs_to :snapshot

  delegate :nombre, to: :accion

  def self.crear_desde_dato(dato, i)
    create(accion: Accion.buscar_o_crear_desde_dato(dato),
           posicion: i + 1,
           visitas_recientes: dato['visitas_recientes'],
           visitas_totales: dato['visitas'])
  end
end
