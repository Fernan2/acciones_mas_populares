class AccionEnSnapshot < ActiveRecord::Base
  belongs_to :accion
  belongs_to :snapshot

  scope :con_nombre_accion, lambda {
    select(:id, :accion_id, :nombre, :posicion, :visitas_recientes, :visitas_totales).joins(:accion)
  }

  delegate :nombre, to: :accion

  def self.crear_desde_dato(dato, i)
    create(accion: Accion.buscar_o_crear_desde_dato(dato),
           posicion: dato['visitas'] || i + 1,
           visitas_recientes: dato['visitas_recientes'],
           visitas_totales: dato['visitas'] || dato['visitas_totales'])
  end
end
