class FundingRound
    ## Class variables section
    @@all = []
    @@INVESTMENT_TYPES = ["Angel", "Pre-Seed", "Seed", "Series A", "Series B", "Series C"]
    ## Attrs definition section
    attr_accessor :startup, :venture_capitalist, :type, :investment
    #attr_reader :founder, :domain

    ## Class Constructor section
    def initialize(startup, capitalist, type, investment)
        self.startup = startup
        self.venture_capitalist = capitalist
        self.type = type
        self.investment = investment
        self.class.all << self
    end

    ## Instance methods section
    
    ## Class methods section
    def self.all
        @@all
    end

    def self.investment_types
        @@INVESTMENT_TYPES
    end

    ## Custom getters / setter section
    
    ## Private methods section
    
end
