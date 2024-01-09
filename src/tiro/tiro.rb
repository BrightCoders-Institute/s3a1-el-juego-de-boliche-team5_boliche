# frozen_string_literal: true

# Clase para definir las características
# generales de un tiro en el Juego del Boliche.
class Tiro
  FINALIZAR_FRAME = false
  DESCRIPCION = ''
  attr_accessor :puntaje

  def initialize(puntaje = 0)
    raise ArgumentError, 'El puntaje debe ser entero' unless puntaje.is_a?(Integer)

    @puntaje = puntaje.clamp(0, 10)
  end
end
