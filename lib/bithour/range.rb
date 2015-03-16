module Bithour
  class Range
    def initialize(max=24)
      @hour_bits = 0
      @max = max
    end

    def add(hours)
      update(hours, "1")
    end

    def remove(hours)
      update(hours, "0")
    end

    def include?(hour)
      @hour_bits[hour] == 1
    end

    def to_a
      bits = ("%0#{@max}d" % @hour_bits.to_s(2)).reverse.split(//)
      hours = bits.collect.with_index {|hour, i| [i, hour]}
      hours.select! {|hour| hour[1] == "1"}
      hours.collect {|hour, bit| hour}
    end

    private
    def update(_hours, bit)
      if _hours.respond_to?(:each)
        hours = _hours
      else
        hours = [_hours]
      end
      hour_str = "%0#{@max}d" % @hour_bits.to_s(2)
      hour_str.reverse!
      hours.each do |i|
        hour_str[i % @max] = bit
      end
      @hour_bits = hour_str.reverse.to_i(2)
    end
  end
end
