require "bithour/day"

class RangeTest < Test::Unit::TestCase
  def setup
    @range = Bithour::Range.new
  end

  def test_new
    assert_not_nil(@range)
  end

  def test_add
    @range.add(0, 0)
    assert_true(@range.include?(0))
    assert_false(@range.include?(1))
    @range.add(2, 4)
    assert_true(@range.include?(0))
    assert_false(@range.include?(1))
    assert_true(@range.include?(2))
    assert_true(@range.include?(3))
    assert_true(@range.include?(4))
    assert_false(@range.include?(5))
  end

  def test_remove
    @range.add(0, 0)
    @range.add(2, 4)
    @range.remove(2, 3)
    assert_true(@range.include?(0))
    assert_false(@range.include?(1))
    assert_false(@range.include?(2))
    assert_false(@range.include?(3))
    assert_true(@range.include?(4))
    assert_false(@range.include?(5))
  end

  def test_max
    @range.add(24, 24)
    assert_true(@range.include?(0))
  end
end
