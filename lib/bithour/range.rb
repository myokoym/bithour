module Bithour
  class Range
    def initialize(max=24)
      @day = 0
      @max = max
    end

    def add(first_hour, last_hour)
      update(first_hour, last_hour, "1")
    end

    def remove(first_hour, last_hour)
      update(first_hour, last_hour, "0")
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
    def update(first_hour, last_hour, bit)
      hours = "%0#{@max}d" % @day.to_s(2)
      hours.reverse!
      first_hour.upto(last_hour) do |i|
        hours[i % @max] = bit
      end
      @day = hours.reverse.to_i(2)
    end
  end
end
