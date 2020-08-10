class FundingRound

    attr_reader :startup, :venture_capitalist, :type, :investment
    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        if investment > 0
            @startup = startup
            @venture_capitalist = venture_capitalist
            @type = type
            @investment = investment
            @@all << self
        else
            "Mo' money please!"
        end
    end

    def self.all
        @@all
    end

end
