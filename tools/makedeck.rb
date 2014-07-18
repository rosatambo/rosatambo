require 'digest'

targetunused = 10

nuf 		= "/home/bitcoin/rosa/decks/nowusing.txt"
nowusingfile 	= File.open(nuf, "r")
  nowusing   	= nowusingfile.readline.chomp
  nowusing 	= nowusing.to_i
nowusingfile.close

lgf 		= "/home/bitcoin/rosa/decks/lastgen.txt" 
lastgenfile 	= File.open(lgf, "r")
  lastgen	= lastgenfile.readline.chomp
  lastgen 	= lastgen.to_i
lastgenfile.close

tobuild = targetunused - ( lastgen - nowusing )
if tobuild == 0
# puts "No files to build. Exiting"
 exit
end

#puts "Files to build: #{tobuild}"

tobuild.times do

  rolls = rand(334..338)  
  raw = ""

  rolls.times do
    raw = raw + "R,P,S,"    #start with even number of R,P,S so that the deck is mostly balanced
    @rockrand = rand(1..50)  #randomize number of rocks in deck
    @rockrand.times do
      raw = raw + "R,"
    end
    @paperrand = rand(1..50)  #randomize number of scisors in deck
    @paperrand.times do
      raw = raw + "P,"
    end
    @scisrand = rand(1..50)  #randomize number of scissors in deck
    @scisrand.times do
      raw = raw + "S,"
    end
  end

  rolls = rolls *3 + @rockrand + @paperrand + @scisrand

  raw = raw[0...-1]
  throws = raw.split(",").shuffle!.shuffle!.shuffle!
  deck = throws.join
  deckhash = Digest::SHA256.hexdigest(deck)


  lastgen += 1
  fname = "/home/bitcoin/rosa/decks/" +lastgen.to_s + ".txt"
  hname = "/home/bitcoin/rosa/hashes/" +lastgen.to_s + ".hash"

#  puts "Building #{fname}"

  deckfile = File.open(fname, "w")
  deckfile.print "Rosatambo Throw Deck # #{lastgen} \n"
  deckfile.print "Throws in Deck: " + rolls.to_s + "\n"
  deckfile.puts deck
  deckfile.puts deckhash
  deckfile.close

  hashfile = File.open(hname, "w")
  hashfile.print "Rosatambo Hash File for Deck # #{lastgen} \n"
  hashfile.puts deckhash
  hashfile.close
end

commitcomment = "Update lastgen to #{lastgen}"
#puts commitcomment
lastgenfile 	= File.open(lgf, "w")
lastgenfile.print lastgen
lastgenfile.close

#  commit and send to github - won't work if running from tools directory :)

system ("git add --all")
system ("git commit -m \"#{commitcomment}\"")
system ("git push origin master")

