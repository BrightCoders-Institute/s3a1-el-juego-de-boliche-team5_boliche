# frozen_string_literal: true

require_relative '../frame/frame'
require_relative '../frame/ultimo_frame'

# Clase para gestionar el
# funcionamiento del Juego del Boliche.
class JuegoBoliche
  def initialize
    @frames = Array.new(9) { Frame.new }
    @frames.push(UltimoFrame.new)
    @puntuacion_global = 0
  end

  private

  def agregar_bonificaciones
    bonificaciones_acumuladas = 0
    conjunto_total_tiros = @frames.map(&:tiros)

    @frames = @frames.each_with_index.map do |frame, numero|
      frame.puntuacion_total += bonificaciones_acumuladas
      bonificaciones_acumuladas += frame.agregar_bonificaciones(conjunto_total_tiros[numero + 1, 2].flatten[0, 2])
      frame
    end
  end

  def imprimir_resultados
    @frames.each_with_index { |frame, numero| frame.imprimir_resultados_frame(numero + 1) }
  end

  public

  def jugar_partida
    @frames.each do |frame|
      frame.jugar_frame
      frame.puntuacion_total += @puntuacion_global
      @puntuacion_global = frame.puntuacion_total
    end

    agregar_bonificaciones
    imprimir_resultados
  end
end
