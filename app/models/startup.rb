class Startup
    ## Class variables section
    @@all = []

    ## Attrs definition section
    attr_accessor :name
    attr_reader :founder, :domain

    ## Class Constructor section
    def initialize(name, founder, domain)
        self.name = name
        self.founder = founder
        self.domain = domain

        self.class.all << self
    end

    ## Instance methods section
    def pivot(name, domain)
        self.name = name
        self.domain = domain
    end

    ## Class methods section
    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        self.all.filter do |startup|
            startup.founder == founder_name
        end
    end

    def self.domains
        self.all.map do |startup|
            startup.domain
        end
    end

    ## Custom getters / setter section
    
    ## Private methods section
    private
    def founder= (founder)
        @founder = founder
    end

    def domain= (domain)
        @domain = domain
    end
end
