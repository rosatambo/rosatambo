# Rosatambo

This is the public repository for Rosatambo

## What's here:

/hashes : all deck hashes, both used and unused.

/decks-used  : Decks and corresponding 

/tools: ugly ruby scripts, including our deck generator and a sample decryptor to verify the decks and hashes match

##How to use this:

To ensure randomness, rosatambo works on a system of predefined throws, ie RPSRRPP (Rock Paper Scissors Rock Rock Paper Paper). We call these throw "decks".
Decks are generated daily, and contain a random number of Rock, Paper, and Scissors throws.  We switch to the next deck when the current deck is completely used, when there are not enough throws in the deck to satisfy a multi-throw bet and at midnight Costa Rica time daily. 

The program ensures we have 10 unused decks.

When the deck is generated, a hash is created, and inserted both into the throw file, and a hash file with the same number. Hash files are name #.hash and deck files are #.txt

Hash files are pushed to github immediately upon generation.  Deck files are pushed only after they are used, to ensure there is no cheating.

If you have any suggestions on how to make this sytem better, please send a PM to rosatambo on the bitcointalk forum. Thanks, and remember, Bart says Rock Always Wins.
<img>http://www.gametheory.net/images/popular/Simpsons/Simpsons2a.jpg</img>
