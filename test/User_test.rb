require "test/unit"
require './src/User.rb'
 
class TestEquipos < Test::Unit::TestCase

  def test_param_to_doc
    user=User.new("Pepe", "test@email.com", "passwordprueba", "user1")

    doc={_id:"1",
    "name":"Pepe",
    "email":"test@email.com",
    "user_name":"user1",
    "password":"passwordprueba"}

    assert_equal(doc, user.params_to_doc(1))
  end

  def test_validate_email
    user=User.new("Pepe", "test@email.com", "passwordprueba", "user1")

    esperado=true
    valid=user.valid_email? ? true : false

    assert_equal(esperado, valid)
  end
end
