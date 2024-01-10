# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../src/motor_juego/juego_boliche'

class JuegoBolicheTest < Minitest::Test
  def setup
    @juego_boliche = JuegoBoliche.new
  end

  def test_puntaje_strike
    strike = Strike.new
    assert_equal 10, strike.puntaje
  end

  def test_puntaje_con_todos_spares
    @juego_boliche.send(:predefinir_tiros!, [[5, 5], [5, 5], [5, 5], [5, 5], [5, 5],
                                             [5, 5], [5, 5], [5, 5], [5, 5], [5, 5]])

    assert_equal 150, @juego_boliche.send(:puntuacion_final)
  end

  def test_puntaje_con_todos_strikes
    @juego_boliche.send(:predefinir_tiros!, [[10], [10], [10], [10], [10],
                                             [10], [10], [10], [10], [10, 10, 10]])

    assert_equal 300, @juego_boliche.send(:puntuacion_final)
  end
end
