require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


google = Startup.new("Google", "Sergey", "search")
yahoo = Startup.new("Yahoo", "Jerry Yang", "search")

a13 = VentureCapitalist.new("Andressen Horowitz", 1500000000)
anson = VentureCapitalist.new("My First VC", 50)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line