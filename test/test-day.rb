require "bithour/day"

class DayTest < Test::Unit::TestCase
  def setup
    @day = Bithour::Day.new
  end

  def test_new
    assert_not_nil(@day)
  end

  def test_add
    @day.add(0, 0)
    assert_true(@day.include?(0))
    assert_false(@day.include?(1))
    @day.add(2, 4)
    assert_true(@day.include?(0))
    assert_false(@day.include?(1))
    assert_true(@day.include?(2))
    assert_true(@day.include?(3))
    assert_true(@day.include?(4))
    assert_false(@day.include?(5))
  end

  def test_remove
    @day.add(0, 0)
    @day.add(2, 4)
    @day.remove(2, 3)
    assert_true(@day.include?(0))
    assert_false(@day.include?(1))
    assert_false(@day.include?(2))
    assert_false(@day.include?(3))
    assert_true(@day.include?(4))
    assert_false(@day.include?(5))
  end
end
