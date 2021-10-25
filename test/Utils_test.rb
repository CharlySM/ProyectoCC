require "test/unit"
require './src/Utils.rb'
require 'json'

class TestUtils < Test::Unit::TestCase

  Utils=Utils.instance

  def test_searchIntoJson

    map=[{"key"=>"value1", "key2"=>"value2"},
      {"key3"=>"value3", "key4"=>"value4"}
    ]

    esperado=true
    salida=Utils.searchIntoJson("key3", "value3", map)

    assert_equal(esperado, salida)
  end

  def test_getJson
    esperado={"key1"=>"value1", "key2"=>"value2","key3"=>{"key31"=>"value31","key32"=>"value32"}}

    salida=Utils.getJson("./test/resources/prueba.json")

    assert_equal(esperado, salida)
  end

end
