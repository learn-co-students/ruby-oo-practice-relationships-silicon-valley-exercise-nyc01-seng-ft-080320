class Startup

    #:domain and :founder are readable only, name can change
    attr_reader :founder, :domain
    attr_accessor :name

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    #Pull all Startups
    def self.all
        @@all
    end
    
    #Start new funding round
    def sign_contract(vc, type, amount)
        FundingRound.new(self, vc, type, amount)
    end

    #Find all funding rounds for THIS startup
    def funding_rounds
        FundingRound.all.select {|fr| fr.startup == self}
    end

    #Count the funding rounds of THIS startup
    def num_funding_rounds
        self.funding_rounds.count
    end

    #How much $$$ in all of the Funding Rounds for THIS startup
    def total_funds
        self.funding_rounds.sum {|fr| fr.investment}
    end

    #Who is invested in THIS startup
    def investors
        self.funding_rounds.map {|fr| fr.venture_capitalist}.uniq
    end

    #Of THIS startups investors, select those that are in the ",,," club
    def big_investors
        self.investors.select {|vc| vc.tres_commas_club}
    end

    #Find the FIRST Startup whose founder matches the inputted founder
    def self.find_by_founder(founder)
        self.all.find {|startup| startup.founder == founder}
    end

    #Map all the unique domains for ALL startups
    def self.domains
        self.all.map {|startup| startup.domain}.uniq
    end

    #Pull all the FundingRounds for THIS startup
    def funding_rounds
        FundingRound.all.select {|fr| fr.startup == self && fr.startup.domain == self.domain}
    end

    #Change :name via attr_accessor, change domain via instance variable
    def pivot(domain, name)
        # self.funding_rounds.each do |fr| 
        #     fr.startup.name = name
        #     fr.startup.domain = domain
        # end
        self.name = name
        @domain = domain
        self
    end

end
