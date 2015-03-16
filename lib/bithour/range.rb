module Bithour
  class Range
    def initialize(max=24)
      @day = 0
      @max = max
    end

    def add(*hours)
      update(hours, "1")
    end

    def remove(*hours)
      update(hours, "0")
    end

    def include?(hour)
      @day[hour] == 1
    end

    def to_a
      bits = ("%0#{@max}d" % @day.to_s(2)).reverse.split(//)
      hours = bits.collect.with_index {|hour, i| [i, hour]}
      hours.select! {|hour| hour[1] == "1"}
      hours.collect {|hour, bit| hour}
    end

    private
    def update(_hours, bit)
      hours = "%0#{@max}d" % @day.to_s(2)
      hours.reverse!
      _hours.each do |i|
        hours[i % @max] = bit
      end
      @day = hours.reverse.to_i(2)
    end
  end
end
