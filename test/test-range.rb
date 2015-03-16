require "bithour/range"

class RangeTest < Test::Unit::TestCase
  def setup
    @range = Bithour::Range.new
  end

  def test_new
    assert_not_nil(@range)
  end

  def test_add_single
    @range.add(0)
    assert_equal([0], @range.to_a)
  end

  def test_add_multiple
    @range.add(*2..4)
    assert_equal([2, 3, 4], @range.to_a)
  end

  def test_add_two_times
    @range.add(0)
    @range.add(2)
    assert_equal([0, 2], @range.to_a)
  end

  def test_remove
    @range.add(0)
    @range.add(*2..4)
    @range.remove(2, 3)
    assert_equal([0, 4], @range.to_a)
  end

  def test_include
    @range.add(0)
    assert_true(@range.include?(0))
    assert_false(@range.include?(1))
  end

  def test_max
    @range.add(24)
    assert_true(@range.include?(0))
  end

  def test_to_a
    @range.add(*0..1)
    assert_equal([0, 1], @range.to_a)
  end
end
