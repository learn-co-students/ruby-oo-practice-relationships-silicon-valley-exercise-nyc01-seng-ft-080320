class VentureCapitalist
    ## Class variables section
    @@all = []

    ## Attrs definition section
    attr_accessor :name, :total_worth
    attr_reader :founder, :domain

    ## Class Constructor section
    def initialize(name, total_worth)
        self.name = name
        self.total_worth = total_worth

        self.class.all << self
    end

    ## Instance methods section
    def offer_contract(startup, investment_type, investment)
        FundingRound.new(startup, self, investment_type, investment)
    end

    def funding_rounds
        FundingRound.all.filter do |round|
            round.venture_capitalist == self
        end
    end

    def portfolio
        self.funding_rounds.map do |round|
            round.startup
        end.uniq
    end

    def biggest_investment
        self.funding_rounds.inject do |a,b|
            a.investment > b.investment ? a : b
        end
    end

    def invested(domain)
        # my_domain_startups = self.portfolio.filter do |portfolio|
        #     portfolio.domain == domain
        # end
        
        # self.funding_rounds.filter do |round|
        #     my_domain_startups.include?(round.startup)
        # end.inject(0) do |total, investment|
        #     total + investment.investment
        # end

        self.funding_rounds.filter do |round|
            round.startup.domain == domain
        end.inject(0) do |total, investment|
            total + investment.investment
        end
    end

    ## Class methods section
    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.filter do |capitalist|
            capitalist.total_worth > 1000000000
        end
    end

    ## Custom getters / setter section

    ## Private methods section
    
end
