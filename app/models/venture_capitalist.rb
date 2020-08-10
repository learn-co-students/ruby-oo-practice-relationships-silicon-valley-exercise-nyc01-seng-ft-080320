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
