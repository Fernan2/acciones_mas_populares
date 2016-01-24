class Accion < ActiveRecord::Base
  has_many :accion_en_snapshots

  def self.buscar_o_crear_desde_dato(dato)
    find_by(id: dato['id']) || crear_desde_dato(dato)
    
  end

  def self.crear_desde_dato(dato)
    accion = create(nombre: dato['name'])
    accion.id = dato['id']
    accion.save
    accion.reload
  end
end
