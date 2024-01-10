# frozen_string_literal: true

require_relative './frame'

# Clase para definir las características
# del último frame del Juego del Boliche.
class UltimoFrame < Frame
  def initialize
    super
    @puntaje_temporal_tiro = 0
  end

  private

  def calcular_resultado_aleatorio_tiro
    return rand(0..10) unless @tiros.first.is_a?(Tiro) && !@tiros.first.nil?

    puntaje = rand(0..10)
    puntaje = rand(0..10) until @puntaje_temporal_tiro + puntaje <= 10
    puntaje
  end

  def configurar_frame_con_spare
    @puntaje_temporal_tiro = 0
    @cantidad_maxima_tiros = 3
  end

  def determinar_spare_strike_o_tiro_normal(puntaje_tiro)
    if puntaje_tiro == 10
      @cantidad_maxima_tiros = 3
      Strike.new
    elsif @tiros.length == @cantidad_maxima_tiros - 1 && @puntaje_temporal_tiro + puntaje_tiro >= 10
      configurar_frame_con_spare
      Spare.new(puntaje_tiro)
    else
      @puntaje_temporal_tiro = puntaje_tiro
      Tiro.new(puntaje_tiro)
    end
  end

  public

  def jugar_frame
    tiro_actual = 1

    while tiro_actual <= @cantidad_maxima_tiros
      efectuar_tiro
      tiro_actual += 1
    end
    @puntuacion_total = calcular_puntaje_frame
  end

  def predefinir_frame(tiros)
    if !(2..3).include?(tiros.length) || tiros.sum > (tiros.length <= 2 ? 10 : 30)
      raise ArgumentError, 'El listado de tiros especificados no es válido'
    end

    tiros.each { |tiro| efectuar_tiro_predeterminado(tiro) }
    @puntuacion_total = calcular_puntaje_frame
  end

  def agregar_bonificaciones(_lista_tiros_posteriores)
    0
  end
end
