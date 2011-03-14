require 'test/unit'
require 'id_stuffer'

class TestIdStuffer < Test::Unit::TestCase
  def test_empty
    l = []
    c = IdStuffer.stuff(l)
    ll = IdStuffer.unstuff(c)
    assert_equal(l,ll)
  end

  def test_empty2
    assert_equal(IdStuffer.unstuff(nil),[])
    assert_equal(IdStuffer.unstuff(''),[])
    assert_equal(IdStuffer.unstuff("0"),[])
    assert_equal(IdStuffer.unstuff(IdStuffer::PREFIX),[])
  end

  def test_simple
    l = [1,2,3,4,5,6,7]
    c = IdStuffer.stuff(l)
    ll = IdStuffer.unstuff(c)
    assert_equal(l,ll)
  end

  def test_simple2
    l = [1,12,23,34,45,56,67]
    c = IdStuffer.stuff(l)
    ll = IdStuffer.unstuff(c)
    assert_equal(l,ll)
  end

  def test_random
    max = 300
    100.times do |i|
      n = 10*(i+1)
      l = (1..n).map{|i| 1+(max*rand()).to_i }.sort.uniq
      c = IdStuffer.stuff(l)
      ll = IdStuffer.unstuff(c)
      assert_equal(l,ll)
    end
  end

  def test_sort
    l = [7,1,6,3,5,4]
    c = IdStuffer.stuff(l)
    ll = IdStuffer.unstuff(c)
    assert_equal(l.sort,ll)
  end

  def test_uniq
    l = [1,2,2,2,3,4,5,6,7,2,2,2,3,3,3,4,5]
    c = IdStuffer.stuff(l)
    ll = IdStuffer.unstuff(c)
    assert_equal(l.sort.uniq,ll)
  end


end
