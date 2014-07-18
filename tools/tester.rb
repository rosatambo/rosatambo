require 'digest'

puts "Testing the file: sample.txt"

file = File.open("sample.txt", "r")
fileday = file.readline.chomp
filerolls= file.readline.chomp
omlette = file.readline.chomp
puts "Supplied Rolls:"
puts omlette
hashbrown = file.readline.chomp
puts "Supplied Hash:"
puts hashbrown

puts "Calculated Hash:"
wtf = Digest::SHA256.hexdigest(omlette)
puts wtf

if wtf == hashbrown
 puts "YES! Shit is Good!"
else
 puts "NO FUCKING WAY THEY FUCKNG CHEAT!"
end

