class VentureCapitalist

    attr_accessor :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    #Create a new Funding Round
    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    def funding_rounds
        FundingRound.all.select {|fr| fr.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.map {|fr| fr.startup}.uniq
    end

    def biggest_investment
        self.funding_rounds.max_by {|fr| fr.investment}
    end

    def invested(domain)
        self.portfolio.find {|startup| startup.domain == domain}
    end

    #I INVENTED INTERNET RADIO!!
    def self.tres_commas_club
        self.all.select {|vc| vc.total_worth > 1000000000}
    end
end
