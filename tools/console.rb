require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
names = ["jhonny", "kain", "adam", "mike", "caren", "sam", "christina", "name8", "name9", "name10"]

startup1 = Startup.new("first startup", "founderX", "domain1")
startup2 = Startup.new("second startup", "founderY", "domain1")
startup3 = Startup.new("third startup", "founderX", "domain3")
startup4 = Startup.new("forth startup", "founderZ", "domain4")
startup5 = Startup.new("fifth startup", "founderZ", "domain5")

investor1 = VentureCapitalist.new(names[0], 1500500000)
investor2 = VentureCapitalist.new(names[1], 1406755000)
investor3 = VentureCapitalist.new(names[2], 450000000)
investor4 = VentureCapitalist.new(names[3], 500000000)
investor5 = VentureCapitalist.new(names[4], 800000000)

startup1.sign_contract(investor1, FundingRound.investment_types[0], 3000000)
startup2.sign_contract(investor1, FundingRound.investment_types[0], 1500000)
startup2.sign_contract(investor1, FundingRound.investment_types[1], 1500000)
startup2.sign_contract(investor2, FundingRound.investment_types[2], 1500000)
startup3.sign_contract(investor2, FundingRound.investment_types[0], 1500000)
startup4.sign_contract(investor3, FundingRound.investment_types[0], 1500000)
startup5.sign_contract(investor4, FundingRound.investment_types[0], 1500000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line