# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../src/motor_juego/juego_boliche'

# Clase para probar el funcionamiento
# general del Juego del Boliche.
class JuegoBolicheTest < Minitest::Test
  FRAME = [0, 0].freeze
  SPARE = [5, 5].freeze
  STRIKE = [10].freeze

  def setup
    @juego_boliche = JuegoBoliche.new
  end

  private

  def evaluar_juego(juego, puntaje_esperado)
    definir_juego(juego)
    comprobar_puntaje(puntaje_esperado)
  end

  def definir_juego(juego)
    @juego_boliche.send(:predefinir_tiros!, juego)
  end

  def comprobar_puntaje(puntaje)
    assert_equal puntaje, @juego_boliche.send(:puntuacion_final)
  end

  public

  def test_puntaje_strike
    strike = Strike.new
    assert_equal 10, strike.puntaje
  end

  def test_puntajes_normales
    5.times do |num|
      evaluar_juego([[num, num], [num, num], [num, num], [num, num], [num, num],
                     [num, num], [num, num], [num, num], [num, num], [num, num]],
                    num * 20)
    end
  end

  def test_puntaje_con_todos_spares
    evaluar_juego([SPARE, SPARE, SPARE, SPARE, SPARE,
                   SPARE, SPARE, SPARE, SPARE, [5, 5, 5]],
                  150)
  end

  def test_puntaje_combinacion_spares
    9.times do |num|
      primer_tiro = num + 1
      segundo_tiro = 10 - primer_tiro
      evaluar_juego([[primer_tiro, segundo_tiro], [primer_tiro, segundo_tiro],
                     [primer_tiro, segundo_tiro], [primer_tiro, segundo_tiro],
                     [primer_tiro, segundo_tiro], [primer_tiro, segundo_tiro],
                     [primer_tiro, segundo_tiro], [primer_tiro, segundo_tiro],
                     [primer_tiro, segundo_tiro], [primer_tiro, segundo_tiro, 0]],
                    100 + primer_tiro * 9)
    end
  end

  def test_puntaje_con_todos_strikes
    evaluar_juego([STRIKE, STRIKE, STRIKE, STRIKE, STRIKE,
                   STRIKE, STRIKE, STRIKE, STRIKE, [10, 10, 10]],
                  300)
  end

  def test_puntaje_spares_strikes_intercalados
    evaluar_juego([SPARE, STRIKE, SPARE, STRIKE, SPARE,
                   STRIKE, SPARE, STRIKE, SPARE, [10, 5, 5]],
                  200)

    evaluar_juego([STRIKE, SPARE, STRIKE, SPARE, STRIKE,
                   SPARE, STRIKE, SPARE, STRIKE, [5, 10, 5]],
                  205)
  end

  def test_puntaje_spares_intercalados
    evaluar_juego([FRAME, SPARE, FRAME, SPARE, FRAME,
                   SPARE, FRAME, SPARE, FRAME, [5, 5, 5]],
                  55)
  end

  def test_puntaje_strikes_intercalados
    evaluar_juego([FRAME, STRIKE, FRAME, STRIKE, FRAME,
                   STRIKE, FRAME, STRIKE, FRAME, [10, 10, 10]],
                  70)
  end
end
