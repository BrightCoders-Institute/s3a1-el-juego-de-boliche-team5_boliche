# frozen_string_literal: true

require_relative './tiro'

# Clase para definir las características
# de un strike en el Juego del Boliche.
class Strike < Tiro
  FINALIZAR_FRAME = true
  DESCRIPCION = ' (strike)'
  attr_reader :puntaje

  def initialize(puntaje = 0)
    super
    @puntaje = 10
  end
end
