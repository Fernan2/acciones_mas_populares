class Accion < ActiveRecord::Base
  has_many :accion_en_snapshots

  def self.buscar_o_crear_desde_dato(dato)
    id = dato['accion_id'] || dato['id']
    nombre = dato['name'] || dato['nombre']
    find_by(id: id) || crear_desde_dato(id, nombre)
    
  end

  def self.crear_desde_dato(id, nombre)
    accion = create(nombre: nombre)
    accion.id = id
    accion.save
    accion.reload
  end
end
