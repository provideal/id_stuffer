require 'test/unit'
require 'id_stuffer'

class TestIdStuffer < Test::Unit::TestCase
  def test_empty
    l = [1,2,3,4,5,6,7]
    c = IdStuffer.stuff(l)
    ll = IdStuffer.unstuff(c)
    assert_equal(l,ll)
  end

 end
