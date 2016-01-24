class AccionesController < ApplicationController
  def show
    @accion = Accion.find(params[:id])
  end
end
