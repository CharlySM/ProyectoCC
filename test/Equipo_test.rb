require "test/unit"
require './src/Equipo.rb'
require 'json'

class TestEquipo < Test::Unit::TestCase

  def test_statisticToJson

    mapIn={"equipo"=>{"ganados"=>12, "perdidos"=>5, "empatados"=>7}}

    equipo=Equipo.new(mapIn)

    esperado="{\"ganados\":12,\"perdidos\":5,\"empatados\":7}"

    salida=equipo.statisticToJson

    assert_equal(esperado, salida)

  end

end
