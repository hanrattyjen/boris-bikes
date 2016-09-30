class Bike
    def report_broken   #(bike)
      @broken = true
    end

    attr_accessor :broken

    def broken?
      broken
    end

    def working?
      true
    end

end
