# frozen_string_literal: true

require_relative './tiro'

# Clase para definir las características
# generales de un spare en el Juego del Boliche.
class Spare < Tiro
  FINALIZAR_FRAME = true
  DESCRIPCION = ' (spare)'
end
