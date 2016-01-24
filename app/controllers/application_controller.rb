class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Presentar el snapshot '1601241241' como '2016-01-24 12:41'
  def id_to_date(id)
    anyo = id[0..1]
    mes = id[2..3]
    dia = id[4..5]
    hora = id[6..7]
    minuto = id[8..9]
    "20#{anyo}-#{mes}-#{dia} #{hora}:#{minuto}"
  end
end
