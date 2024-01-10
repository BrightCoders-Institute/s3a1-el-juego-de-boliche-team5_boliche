# frozen_string_literal: true

require_relative '../tiro/tiro'
require_relative '../tiro/strike'
require_relative '../tiro/spare'

# Clase para definir las características
# de un frame del Juego del Boliche.
class Frame
  attr_accessor :puntuacion_total, :tiros

  def initialize
    @cantidad_maxima_tiros = 2
    @puntuacion_total = 0
    @tiros = []
  end

  private

  def frame_contiene_strikes?
    @tiros.any? { |tiro| tiro.is_a?(Strike) }
  end

  def frame_contiene_spares?
    @tiros.any? { |tiro| tiro.is_a?(Spare) }
  end

  protected

  def calcular_resultado_aleatorio_tiro
    return rand(0..10) unless @tiros.first.is_a?(Tiro) && !@tiros.first.nil?

    puntaje = rand(0..10)
    puntaje = rand(0..10) until calcular_puntaje_frame + puntaje <= 10
    puntaje
  end

  def calcular_puntaje_frame
    @tiros.sum(&:puntaje)
  end

  def determinar_spare_strike_o_tiro_normal(puntaje_tiro)
    if @tiros.empty? && puntaje_tiro == 10
      Strike.new
    elsif @tiros.length == @cantidad_maxima_tiros - 1 && calcular_puntaje_frame + puntaje_tiro >= 10
      Spare.new(puntaje_tiro)
    else
      Tiro.new(puntaje_tiro)
    end
  end

  def efectuar_tiro
    puntaje_tiro = calcular_resultado_aleatorio_tiro
    @tiros.push(determinar_spare_strike_o_tiro_normal(puntaje_tiro))
    @tiros.last.class::FINALIZAR_FRAME
  end

  def efectuar_tiro_predeterminado(puntaje_tiro)
    @tiros.push(determinar_spare_strike_o_tiro_normal(puntaje_tiro))
    @tiros.last.class::FINALIZAR_FRAME
  end

  public

  def jugar_frame
    @cantidad_maxima_tiros.times do
      break if efectuar_tiro
    end
    @puntuacion_total = calcular_puntaje_frame
  end

  def predefinir_frame(tiros)
    if tiros.length > @cantidad_maxima_tiros || tiros.sum > 10
      raise ArgumentError, 'El listado de tiros especificados no es válido'
    end

    tiros.each { |tiro| efectuar_tiro_predeterminado(tiro) }
    @puntuacion_total = calcular_puntaje_frame
  end

  def agregar_bonificaciones(lista_tiros_posteriores)
    return 0 if lista_tiros_posteriores.empty?

    if frame_contiene_strikes?
      @puntuacion_total += lista_tiros_posteriores.sum(&:puntaje)
      lista_tiros_posteriores.sum(&:puntaje)
    elsif frame_contiene_spares?
      @puntuacion_total += lista_tiros_posteriores.first.puntaje
      lista_tiros_posteriores.first.puntaje
    else
      0
    end
  end

  def imprimir_resultados_frame(numero_frame)
    puts "||--------------- Frame #{format('%02i', numero_frame)} --------------||"

    @tiros.each_with_index do |tiro, numero|
      print "|| Tiro no. 0#{numero + 1} -----> #{format('%02i', tiro.puntaje)}"
      puts "#{format('%-9.9s', tiro.class::DESCRIPCION)}        ||"
    end

    puts '||---------------------------------------||'
    puts "|| Puntaje obtenido = #{format('%03i', @puntuacion_total)}                ||"
    puts '||---------------------------------------||'
    puts ''
  end
end
