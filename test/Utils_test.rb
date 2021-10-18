require "test/unit"
require './src/Utils.rb'

class TestEquipos < Test::Unit::TestCase

  Utils=Utils.instance

  def test_searchIntoJson

    map=[{"key"=>"value1", "key2"=>"value2"},
      {"key3"=>"value3", "key4"=>"value4"}
    ]

    esperado=true
    salida=Utils.searchIntoJson("key3", "value3", map)

    assert_equal(esperado, salida)
  end

end
