:: StoryTitle
Creative Writing Project -- Colton Keiser


:: StoryData
{
  "ifid": "05E83F7C-608D-4114-884C-7EE53F4F6FDE",
  "format": "Harlowe",
  "format-version": "3.3.8",
  "start": "Start",
  "zoom": 0.6
}


:: \ Dungeon Quest\  {"position":"2900,525","size":"100,100"}
You choose the Dungeon Quest hanging on the bulletin board. It calls for the exploration of the abandon Dwarven mines of Skarsgarl. You remember the Myconid colony of the Astarians now live in these dungeons. There will be a journey to the mines ,hopefully your party is both ready... and *lucky*...

	Before the group leaves Brimly introduces you to one of the games in the tavern.
    
   Brimly remarks "$name role the dice and hit large so we have great fortune on our journey!!!"
   
   You hunch over the betters table and for fun role a whole set of dice... your outcomes are:
   *D4: $D4
   
   D6: $D6
   
   D8: $D8
   
   D20: $D20
   
   D100: $D100*
   
After seeing your *luck* you are ready for your journey.
[ [[Path to Skarsgarl]] ]


:: A conclusion to the investigation {"position":"1600,1400","size":"100,100"}
The following day you hear a large crowd gather. It is a knockout Doppelganger. They are still alive although in a incapacitated state. Once they are properly secured the intergations start.  Lyssandra casts a hex to force the creature to tell them everything they know.

But the Doppelganger looks at you curiously... 

In fact it only looks at you... 

The Doppelganger has no mouth but it must speak, for you hear a voice. Its telephathic. 

*"An adolescent Sovereign...Why are you here?"*

Lyssandra immediately knocks it unconscious. She knows something that you don't.

<img src="C:\Users\colto\Dropbox\DoppelGanger.png"\>

[[Decision]]


:: Absorb the evidence? [sov] {"position":"2075,1350","size":"100,100"}
*You absorbed the strange substance... You see visions of what this strange creature could be. You hear voices, they remind you of something but you're not sure what...*

(if: $wit is true) [You see visions of a strange alien like creature...Is that the strange witness man?
[[Doppelwhat?]]]


:: Accept Hermit Aid {"position":"3375,775","size":"100,100"}
The party accepts the old Hermit's aid. Traversing the Thicket is second nature for a man who's been living there for a couple of decades. He explains that he was sanctioned the land is cottage currently is on. From his good friend the King of Caldea. Although old with dwindling senses, the Hermit roams the Thicket with poise and ease. Eventually the party ends up in front of the gates of Skarsgarl. The party waves goodbye to the Hermit and now stand in front of the giant iron door of the dungeon.
    [[Iron Gate of Skarsgarl]]


:: An Adventurer {"position":"1900,1075","size":"100,100"}
You chose to set off with your new found friends! Leaving the colony behind you wonder when will be the next time you gaze upon the grove. With that uncertainty aside you look forward to the adventurers that your party will have. The party needs to return to the guild of Oftsburg to collect coin on their Leech bounty. 
	As you leave the grove, you are no longer under the shade of the sprawling vegetation and now face direct sunlight. This strains you but you know you'll have to adapt. Growing out your mushroom cap you use it as an umbrella to block sunlight from drying out your softer Mycellium body. Fried also gives you a dark green rangers cloak so you don't have to strain your body in the short term. 

You start to see Oftsburg in the distance. The closest human settlement to the Grove. Right next to Orlan's Thicket and the dwarven mines of Skarsgarl. Its a bustling village where your party's guild is in the town center. As you go throughout the city you hear much commotion going on. Chatty bards singing their ballads for some coin, lowly merchants asking you to check out their wares, and other clamor that is just out of comprehension. You go inside the guild, as the city center it also appears to work as a tavern. Brimly goes up to the clerk to cash in on the Leech bounty. 

The clerk stammers "Brimly half of them are already dried up, and some of them are eels"

Brimly retorts "Their all the same really and you never told us dead or alive", he shrugged.

You along with the rest of the party are looking at the currently avaiable quests. Since its your first time, Aria and Fried want you to pick the first quest. Lysandra sits down at the tavern indifferent and orders a DPA "Dwarf Pale Ale". Excited for your first quest you look at the list. A Murder Investigation? That would explain all the commotion you could barely make out coming into town. A Dungeon Quest? That could be exciting but also a very standard first quest. Then there's a Bounty Quest, similar to the leech quest you wonder what you'll be doing in this one specifically?


<img src="C:\Users\colto\Dropbox\Town.png"\>

[[Murder Investigation Quest ]] 
[[ Dungeon Quest ]] 
[[Bounty Quest]]


:: Astarians {"position":"3150,1075","size":"100,100"}
*Intelligence Check: D4: $D4*

(if: $D4 is 4) [
The Astarian's Sovereign stops you. It looks closely into your soul. It speaks to you telling you that you are an adolescent Sovereign. You and your party would be a great aid in helping the Astarian's and the Penterelle overthrow Sporehaven grove. Do you except this as your [[path]]?
]

(if: $D4 is <4) [
The Astarian Sovereign stops you for a moment. But simply greets you with a strange expression. You sense it wanted to say something but you decide to look past the odd interaction. The Astarians guards escort your party to the final room of the [[dungeon]]. 
]


:: Bounty Quest {"position":"975,550","size":"100,100"}
The party accepts the bounty quest! It consists of finding the local hermits run away dog. The hermit was once a great warrior of the Contentant. A trusted Templar Knight to the King of Caldea. After their adventures together, he now resides on granted land to live a leasurly life. He exclaims to the party that he's ashamed to ask for assistance as its such a novel task. But, he's not as capable as he used to be for he is no longer the man he was known as. 

	He's willing to pay a reasonable 250G for the return of his trusted companion. As he's grown quite reliant on the canine in his old age for both hunting and company. The hermit lives in the middle of the Orlon's Thicket, and lost contact of his companion in the middle of a hunting trip. 
    
(if: $unite is true) [You remember the Penterelle live in Orlan's Thicket. Although The Sovereign concerned itself greatly with this colony due to its proxy to Sporehaven. You believe they could help the party out. They have lived in this forest for many centuries and know it better than any creature. If anything happens in their domain, they would know.
]
(If: $unite is true) [Ask for a favor:
[[The Penterelle]]
]
(if: $unite is false) [The Hermit tells the party to check up on the hunting trail since that's the last place his dilapitaded memory remembers his canine companion. He also mentions to be wary of the Myconid in the colony mentioning how they can't be trusted and should know better than to get near his property, pointing at the longsword hanging above his door.]

(if: $unite is false)[ [[Main Trail Evidence]]

]
(if: $unite is false) [Take the Hermit's Advice
[[Hermit's Advice]]
]


:: Council Member {"position":"2175,675","size":"100,100"}
You choose the life of a council member. The role appointed to you from the start. How befitting that you settle with what you know and what is comfortable. There may have been more potential in you. Your friends and even The Sovereign saw this potential but if only you would've.  Your friends visit the Grove on multiple occassions to try to convince you to travel with them but you refuse. Your will is that of The Sovereign's. 
    
	You live out the rest of your life as a council member. Going through the Ceretet transformation was a painful process as your body develops to accomdate for your new intellect. Your mind loses track of the individual you use to be. Your mind is now property of the colony and can only think like one of Kurzheimer's machines. You are no longer $name just another Ceretet. Doing the bidding of The Sovereign.

1/18
Ending


:: Cyclops {"position":"975,1050","size":"100,100"}
The party is relieved to see the hound alive and having found a new friend. The party is confused on how they should go about the situation. Since its you're first quest the party wants you to make the decision. Maybe also to shift the decision away from themselves. You thought about your options... But you remember your choice in the council room...


(If: $unite is true)[Diplomacy:
[[Reason with Cyclops]]
]

(If: $war is true)[Warmonger:
[[Violence]]
]

(If: $util is true) [Utilitarian:
[[Tell the Hermit]]
]


:: Decision {"position":"1600,1525","size":"100,100"}
Lyssandra has been quiet for far too long. You ask her whats wrong and to explain what the Doppelganger is talking about...

	Lyssandra explains "As a Tiefling, I have the abilty of telekinesis like the Doppelganger... Ever since we met you $name, I've known. I've known that you have the ability to become a Sovereign also. The Sovereign of Sporehaven Grove never wanted you to leave but I put a mind control spell on it to allow you to join us. Ever since you have been bombarded by commands from The Sovereign to come back to the Grove. Although I've done my best to block them. Whatever you choose next we will be alongside you till the end, what do you think $name?"


(If: $unite is true) [Unite the Myconid Kingdoms
[[Uniting the Colonies Ending ]]
]

(If: $war is true) [The party vs The Sovereign
[[War Ending ]]
]

(If: $util is true) [Continue your adventures and escape The Sovereign's influence
[[Exploration Ending ]]
]


:: Decision\  {"position":"2075,1625","size":"100,100"}
The Doppelganger is now properly restricted. Lyssandra has been quiet for far too long. You ask her whats wrong and to explain what the Doppelganger is talking about...

Lyssandra explains "As a Tiefling, I have the abilty of telekinesis like the Doppelganger... Ever since we met you $name, I've known. I've known that you have the ability to become a Sovereign also. The Sovereign of Sporehaven Grove never wanted you to leave but I put a mind control spell on it to allow you to join us. Ever since you have been bombarded by commands from The Sovereign to come back to the Grove. Although I've done my best to block them. Whatever you choose next we will be alongside you till the end, what do you think $name?"

(If: $unite is true) [Unite the Myconid Kingdoms 
[[Unite the Colonies Ending]]
]

(If: $war is true) [The party vs The Sovereign
[[War Ending]]
]

(If: $util is true) [Continue your adventures and escape The Sovereign's influence
[[Exploration Ending]]
]


:: Diplomat {"position":"1700,500","size":"100,100"}
The meeting ends abruptly after vast amounts of discourse between the Ceretet. Oddly enough *The Sovereign* has you and the other newly appointed Myconid leave the council room for the final decision. Once the meeting ends you hear a warning from a Varnvetore at the front of the colony's gates. The Varnvetore with its powerful elongated cap dozens of feet above the grove sirens that a storm is coming. You head back to your house to prepare to brave the storm. The colony can handle a storm but what about unsuspecting vistors?
    (set: $war to false) (set: $unite to true)(set: $util to false)
    You hear a knocking on your door. After a slight hesitation it swings open with 4 bumbling oafs tumble into your small mushroom cottage. They introduce themselves with as Brimly Engelhardt, Aria Lucius, Fried Licht, and Lysandra Nachtraum a tiefling. Members of the adventurer's guild of Oftsburg they were on a bounty quest for collecting 20 leeches for a local doctor before getting caught out in the storm. Now you have a bag of 20 leeches on your well kept floors.......
    
    The colony of Sporehaven Grove is friendly with outsiders and does frequent trading with the nearby settlements. The guards let them past since *The Sovereign* didn't authorize against it. 

[[Newcomers]]


:: Doppelwhat? {"position":"2075,1500","size":"100,100"}
You snap out of your daze. Lyssandra and yourself both understand the situation. You're being followed. The gang chases towards the uncanny man. Brimly and Fried tackle him and douse the strang being in phosphorous powder. As the illusion fades away the true creature is revealed. An towering fiend with colorless skin and pale eyes. A Doppelganger.

The Doppelganger looks at you. It knows what you truly are. It speaks to you although it has no mouth,

*"An adolescent Sovereign? How peculiar... But you're different"*

The party is silent but Lyssandra is glaring right at you to see your reaction...

<img src="C:\Users\colto\Dropbox\DoppelGanger.png"\>

[[Decision ]]


:: Evidence {"position":"1900,1350","size":"100,100"}
The group ops into searching for evidence. Through the guild you get approval to search the crime scenes. There's a motif of a strange residue left over at the scene, the party has a few suspicisons of what this could be.  Still unsure you can still look for some witnesses.
(set: $evi to true)


[[Absorb the evidence?]]
[[Witnesses]]

(If: $evi and $wit is true)[[Traps ]]
(If: $wit is false)[[Traps]]


:: Exploration Ending {"position":"1950,1750","size":"100,100"}
You ponder this decision for a long time. You think back on your time at Sporehaven Grove and the other Myconid there. How they are devoid of life and are define by the continual pursuit of expansion. You remember the council meeting and how you chose the middle grounds. Not to sure on war or diplomacy. This indecisiveness carry's into this decision. 
	You wanted independence from The Sovereign and thats what you got. You wanted to travel with your friends and have grand adventurers and so far that's been the case. You know that Lyssandra can't defend you from The Sovereign's mental onslaught forever. But The Sovereign is not omnipotent. If you travel faraway on the vast continent it won't be a factor anymore.
    If you were to seek conflict further you would still be defining yourself by its existence. You are your own person, you are $name. You and your party including the Doppelganger, continue your lives exploring the continent doing quests for coin and living fulfilling lives. 

<img src="C:\Users\colto\Dropbox\Sovereign Myconid.jpg"\>

The End

16/18 Ending


:: Exploration Ending\  {"position":"1350,1675","size":"100,100"}
You ponder this decision for a long time. You think back on your time at Sporehaven Grove and the other Myconid. How they are devoid of life and are define by the continual pursuit of expansion. You remember the council meeting and how you chose the middle grounds approach. Not to sure on war or diplomacy. This indecisiveness carry's into your current decision. 
	You wanted independence from The Sovereign and thats what you got. You wanted to travel with your friends and have grand adventurers and so far that's been the case. You know that Lyssandra can't defend you from The Sovereign's mental onslaught forever. But you know that The Sovereign is not omnipotent. 
    You know that if you travel faraway on the vast continent The Sovereign can not pursue anymore. If you were to seek conflict  you would still be defining yourself by The Sovereign's existence. You are your own person, you are $name. Your party continues exploring the continent being hired for quests and seeing the world.

<img src="C:\Users\colto\Dropbox\Sovereign Myconid.jpg"\>

The End

13/18 Ending


:: Explore the prints {"position":"975,925","size":"100,100"}
The group follows the footprints that go straight through the thicket. Being on high alert as the large trees have been reduced to their base trunks. This must be from whatever atrocity commited this leisure stroll through the woods. Through the thicket you encounter numerous large arachnids, screaming cockatrices, and much more nothing the party can't easily handle or ignore. The prints lead you to a large opening of a cave.
    
     The mouth of the cave faced an opening into the forest. The party was prepared for whatever creature called this place home. As they traversed the suprising deep cave a figure came into frame. A massive one eyed colossus of flesh. A species of ogre known as a Cyclops. But the Cyclops wasn't alone for he was playing with the hermits trusty hound. 
    
	Seems as though the Cyclops has taken a liking to the hound. The hound does not seem to be in danger in any form...

[[Cyclops]]


:: Go to the Meeting {"position":"1900,375","size":"100,100"}
You are now on your way to the council meeting in the center of the grove. Although its common for Myconid to be intune with nature, The Sovereign has made it a big focus for the colony to expand. Maybe Mushrooms are not much different than man afterall. 
    
    Some of your kind have been specialized for these tasks, Besphemore are towering, hulkish beings that push the limits of their hyphaic bodies. Towering over the Grove's Mycellic buildings, they clear out new paths in the dense Thickets. Using this organic debris, Geratories break down the rubble into useful Mycellic building blocks that the Besphemore can use to further expand the colonies infrastructure. You see your kin working vigorously on your way to the meeting.  

	You arrive at the council building. A massive structure that sticks out of the center of the colony. You enter in, where there is a massive council room with Ceretet members circling the round table. *The Sovereign* is not here yet. Seeing the other council members is always unsettling as they don't look like a living being at this point.
    
    Specifically trained to be expert strategists and perform complex calculations. They remind you that they may be little more than those machines the human artificer Kurzheimer tinkers with. Their once small mushroom caps have encompassed most of their bodies. Their hyphae connect to one another around the conference table to exchange information amongst each other even more efficiently. *The Sovereign* demands efficiency out of its drones.

	For some reason you haven't been forced to go through this same process. By consuming vast amounts of the substance this can completely alter one's body to its desired form. All of a sudden *The Sovereign* appears, its presence is greater than any Besphemore even though its a fraction of the size. The once clamoring room that was full of planning around infrastructure and battle strategy is now quiet. 
    
    The topic for today is around the expansion of the colony. There is a mass hysteria over the intentions of our Myconid neighbors the Astarians of the mines of Skarsgarl and the Penterelle of Orlan's Thicket. You don't participate in the discussion as a newcomer. The Certet pass around ideas to *The Sovereign*. What views do you agree with?

[[Diplomat]] 

[[Utilitarian]]

[[Warmonger]]


:: Guiding Light {"position":"3000,1000","size":"100,100"}
(bg:(gradient: 0, 0,#ffffff,0.4434,(hsl:60,0.8039,0.5,0.55),1,#ffffff))[Aria casts Guiding Light]

The party ventures forth. With the aid of the Guiding light they are able to dodge booby traps and debris in the abandon mine. 

(if:$unite is false) [
	The party comes across a rather large chest. With ooze dripping from the outside of fairly old wooden container. Brimly as dwarfs tend to do launches at the opportunity to get his hands on some treasure. As he gets close the chest reveals its true form,
    "It appears to be a [[mimic]]" says Lysandra.
    Brimly drops back and the party prepares for combat.
<img src="C:\Users\colto\Dropbox\mimic.png"\>
]

(if: $unite is true) [
	Luckily you catch a whiff of familiar spores that have helped you thus far on your journey. The Astarians must be somewhere in these mines! As you follow the spore trail you come across the colony. Specially adapted for the mines they all have developed bioluminescence, and live within the mines. Making them perfect for helping the party venture forth. [[Astarians]]
]


:: Hermit's Advice {"position":"1150,725","size":"100,100"}
The party decides to heed the old man's advice. Taking the path less traveled, the hunting trail. They scale up hilly terrain. The party remembers the warning of the Penterelle colony that is destined to be near. As the party continues up this rocky path they come across a crater. 

But as you point out, "This is no crater, but footprints."

You can follow the prints that take you back to the main trail outside the Hermit's cottage. 

(set: $HA to true)

[[Main Trail Evidence]]


:: Iron Gate of Skarsgarl {"position":"3150,900","size":"100,100"}
The party ends up in the front of the former dwarven fortress of Skarsgarl. The hulking, alluming, dwarven fortress is quite overwhelming to the party. Except Brimly who is quite giddy for the chance to visit his ancestors old kingdom. The party enters the dungeon. 

Aria asks, "Should I cast my spell, (bg:(gradient: 0, 0,#ffffff,0.4434,(hsl:60,0.8039,0.5,0.6),1,#ffffff))["[[Guiding Light]]"]? There's not much natural light in here."

Brimly fires back, "[[No]], we should be weary of our presence in these mines. A light would only be a beacon to anything living in here."


:: Main Trail Evidence {"position":"975,725","size":"100,100"}
Going outside the Hermit's log cabin, you find a dirt path heading deeper into the Thicket. On this path you find little evidence related to the Hermit's dog. You remember the Hermit's advice you can always utilize it if need be. 

(set: $TE to true)

[[Hermit's Advice]]

(if: $HA is true) [Although the trail is damp from heavy rainfall recently you manage to make out some large footprints, along with prints that match the description of the Hermit's trusty companion. Do you wish to explore these prints further?]

(if: $HA is true)[ [[Explore the prints]]]


:: Murder Investigation Quest\  {"position":"1900,1225","size":"100,100"}
	The group chose the Murder Investigation Quest! The reward is 500G to investigate a series of murders that have been occuring across local towns near the Guild. The victims have consisted of Oftsburg locals, lowsy bards, and low rated adventurers. Since its your first quest, the party wants you to take the lead. How should the party go about solving this murder 

[[Traps]]

[[Witnesses]]

[[Evidence]]


:: New Companions {"position":"1900,800","size":"100,100"}
For the next couple of days the group stays in the grove. Slightly wounded from their leech hunting quest. They ran into plenty more than just those blood sucking worms. Brimly and Fried explain to you the waterpaths they explored had giant salamanzer's, turtle's the size of small islands, and an aquatic Wyrm that chased the gang off. As they tell you stories of their adventurers, Aria the group cleric empowered by the goddess Seraphine tends to everyone's minor wounds. 
    
    Aria holds the others accountable with their talltales "the Salamanzer was NOT as large as a obsidian caveworm, Brimly... You've never even seen one before!!"

  
	Enchanted by these tales and emboldened by your new name $name. You feel the desire to see these sightings for yourself! No Myconid you've ever known has had a name, thats not their role within the colony. Even The Sovereign doesn't have a name. Once coming to this realization you start to feel off. Lysandra gives you a piercing stare and you slightly feel better.
    
    You have found new companions who see you as $name. The being you want to be. Emblazon by this new found identity you wish to set out with your friends. They happily welcome you.
    
    Brimly jokingly says "We took a liking to you when we first met. If you didn't wanna come along we were gonna steal ya anyway."

[[Setting Out]]


:: Newcomers {"position":"1900,650","size":"100,100"}
Although the Myconids are friendly to the human settlements, you don't know much about the world outside the grove. The Adventurers also don't know much about Myconid.
    
Brimly the most outspoken one of the group asks you, "What is your name"
    
You grow a mouth in order to speak as Myconid usually don't communicate through speech but spores. 

(set: $name to (prompt: "Brimly asks What is your name? ", "..."))

$name you say

[[New Companions]]


:: No {"position":"3300,1000","size":"100,100"}
*Luck Check: D100: $D100*

(if: $D100 is >=90) +(if: $unite is false)[By some miracle the group is able to swiftly dodge all the traps and debris covering the dungeon floor. Somersaulting, cartwheeling, and twirling to dodge shooting arrows, bear traps, and rolling boulders they make it to the end of the dungeon with relative ease. The monster guarding the treasure is a massive haunted armor of a great knight. Lysandra luckily uses a fire incantation that incinerates the armor. Turns out the armor wasn't haunted but a family of mollusks had been living in the armor and using it as protection like a hermit crab. The party takes the treasure and leaves the dungeon without a scratch. You become great adventurers and wealthy from your great luck. Sometimes you think about your first quest, and how weirdly lucky you have were.

Ending 8/18
]

(if: $unite is true) [ The party is stumbling through the dungeon. Running into every trap from rolling boulders, bear traps, cave spiders, and goblins mischievously pouring oil and goose feathers from the upper floors of the dungeon. Luckily you catch a whiff of familiar spores that have helped you thus far on your journey. The Astarians must be somewhere in these mines! As you follow the spore trail you come across the colony. Specially adapted for the mines they all have developed bioluminescence, making them perfect to help the party through the mines.
[[Astarians]]
]

(if: $unite is false) + (if: $D100 is <90) [
	The party attempts to make it through the dungeon without light but simply can't. You remember some of your kind can glow in the dark but you haven't absorbed any nutrients that would help you adapt to have bioluminescence. Brimly apologizes to Aria and admits he's wrong and that it would be best to cast (bg:(gradient: 0, 0,#ffffff,0.4434,(hsl:60,0.8039,0.5,0.45),1,#ffffff))[ [[Guiding Light]] ] 
]


:: Path to Skarsgarl {"position":"3175,550","size":"100,100"}
The party leaves the small village with no guarntee they will return to collect their prize of 500 Gold. The group decides to cut through the Orlan's Thicket, a densly packed forest with narrow paths that'll make traversal challenging for the group. 

(if: $unite is true) [
You remember that this forest is home to one of the other Myconid colonies the Penterelle. You could see out their aid to help your party gain passage through the forest. [[Seek the aid of the Penterelle]] 
]

(if: $D8 is >1) + (if: $unite is false) [
*Your combat check: D8: $D8 *
	The party can think of no aid to help them through the thicket. They venture forth, and encounter a Cockatrice. A large chicken like creature with a tail reminiscent of a lizard's. The party braves for the encounter... The Cockatrice is swiftly defeated as Lysandra casts a hex on the creature binding it to the ground, while Fried swiftly shadow steps appearing through the creatures shadow knocking it out, in the coolest of fashion. The party continue on their way to the [[Iron Gate of Skarsgarl]] 
<img src="C:\Users\colto\Dropbox\Cockatrice.png"\>
]

(if: $D8 is <=1) + (if:$unite is false) [
*Your combat check: D8: $D8*
	The party can think of no aid to help them through the thicket. They venture forth, and encounter a Cockatrice. A large chicken like creature with a tail reminiscent of a lizard's. The party braves for the encounter...Some how, some way... The entire party has been bested by little more than a chicken. You thought the gods were throwing you an underhand with your first encounter. But from sheer incompetence or not being favored by the gods, you have not been favored by this world's cruel gods. You pass away not as a glorious and worshipped adventurer but as a lowsy chicken's dinner. 
<img src="C:\Users\colto\Dropbox\Cockatrice.png"\> 
Ending 2/18
]

(if: $D100 is >=25) + (if: $D6 is >=3)[
*Your perception check D100: $D100 and D6: $D6 *
	The party comes across an old man, a Hermit. He offers his aid to get through the thicket. He lives in a cottage near the entrance of the dense woods. An old man but once a great warrior and companion of the King of Caldea He could be quite helpful in helping the party cross the Thicket. [[Accept Hermit Aid]]
]


:: Reason with Cyclops {"position":"775,1200","size":"100,100"}
You decide to reason with the Cyclops being a Mushroom. You communicate with him telephathically and come to the shared conclusion. You will calmly introduced the Hermit to the situation and hopefully they can live in harmony, having a joint relationship with their hound companion. 

	This came with its own struggles as the Hermit has become quite paranoid in his older years. But since he trusts your party, he eventually comes around to having a new strong companion with the Ogre.
    
    But you remember your promise to the Penterelle. The party merges with their Penterelle forces and quickly march over to the Astarian's you are quickly persuaded by your ability to already win over the Penterelle. With the aid of a two Myconid colonies and learning and preparing under two fair ruling Sovereign's you are able to gain a great deal of strength for your final battle. Your party also learns from the Myconid colonies. Lysandra and Aria learn a great deal of magic from the Myconid rot mages, and healing practices. While Brimly and Fried are introduced to Mycellic armor and weaponry.
    
    Eventually the time has come. Sporehaven knows about your preparation for this battle from Myconid scouts, and The Sovereign's telepathy. They have equally prepared for the day the colonies meet. When you meet on the battlefield it is truly a gruesome day. Rot mages wipe out legions of drones. Besphemore act as carriers for solider's with whole caravans and armories on their backs. Ceretet are at the Sporehaven colony directing troops in real time with the passage of spore's. Truly a grand sight. Ultimately your forces come out on top and you are exalted as the new king, the new Sovereign. Ushering in a new age of peace and just ruling. Your party members become your royal advisors and their was a new age of human influence in the grove's. With most of the world being newly introduced to Myconid products and trade routes.
    
  
Ending
5/18


:: Seek the aid of the Penterelle {"position":"2975,675","size":"100,100"}
Going deep into the Thicket, you feel at home. The trees and vegetation create a canopy to provide shade for those on the forest floor. You realize this'll be a perfect spot for Myconid to flourish. As you continue on the forest path, you come across a strong current of spores in the air. You are close to the Penterelle.
    You don't find the colony first, but you come across Penterelle ranger's on a patrol. 
    
*Charisma Check: D20: $D20*
*Combat Check: D100: $D100*
(if: $D20 is >=5) [The guards see your honest nature and are won over by your caring nature. They see you have a name, $name. No, Myconid they've ever met has had a name. They gladly accept you as one of their own. They take you to their [[Sovereign]].
]
(if: $D20 is <5) + (if: $D100 is >25) [The scouts don't trust you. But they are intimidated by your larger size. Although you bear a resentment for your upbringing in Sporehaven atleast you're far larger than other Myconid. They listen to your demands and take you to their [[Sovereign]].
]

(if: $D20 is <5) + (if: $D100 is <25) [The scouts don't trust you. They are also not intimidated by your larger size. They call upon their Penterelle comrades and swiftly overwhelm the newly formed party. The gods were not in your favor. You wanted to unite the Myconid colonies but it takes more than skill to win over the masses, you also need luck.

Game Over

Ending 3/18
]


:: Setting Out {"position":"1900,925","size":"100,100"}
As the days go by, the party has regained their strength. You meet with The Sovereign privately to ask permission to leave the grove and see the outside world. The Sovereign suprisingly enough permits you to leave with relative ease. Although you doubt its true intentions. 
    
    With that uncertainty aside you look forward to the adventurers that your party will have. But there is still some hesistancy on if this is truly the right path for you. You ask yourself, "What would you rather prefer being a council member or an adventurer?" Of course there's your own ambitions but what about the colony and The Sovereign that have raised you? Isn't this where you belong? 
    
What do you choose?

[[An Adventurer]]

[[Council Member]]


:: Sovereign {"position":"2975,800","size":"100,100"}
*Intelligence check: D20: $D20*

	You approach The Penterelle's Sovereign. Although smaller and seemingly weaker than the Sporehaven Sovereign. You can tell this Myconid commands great importance and presence. 
(if: $D20 is >=18)[ 
	The Sovereign's expression becomes serious as you approach. It senses a great deal of importance in your arrival. The Penterelle Sovereign says "$name you have grown strong since you've left the Grove. I do not know how you escaped Sporehaven but we are glad you've gained independence from Sporehaven's Sovereign. The Astarians of the mines of Skarsgarl are similar to us. Myconid should be one with nature, this is the natural state of our kind. The Sovereign of Sporehaven Grove has bastardized this idea. Expanding its colony to multiple mangnitudes that of Astaraia's or us. $name I see you've been suppressed. You are a Sovereign yourself. Your friend has gracefully held off Sporehaven's Sovereign from calling you back to the colony. It is up to you to decide your path now. You are the first Mycnonid to have a name and to gain independence outside of their original Sovereign. It is not to the Astarian's or us to direct you on your next course of action but whatever you choose we will follow in your lead." [[Unite the Myconid]] or [[Iron Gate of Skarsgarl]] 
]

(if: $D20 is <18)[
	The Sovereign's peers at you cautiously. It senses something strange about you but doesn't mention it. You ask for sanction and protection to cross the Thicket. The Sovereign nods its large bulbous head. You are escorted by Penterelle guards to the outskirts of the Thicket and end up in front of the [[Iron Gate of Skarsgarl]]
]


:: Start {"position":"1900,125","size":"100,100"}
[[Start your Journey]]

	(set: $D4 to (random: 1, 4))
   	(set: $D6 to (random: 1, 6))
  	 (set: $D8 to (random: 1, 8))
  	 (set: $D20 to (random: 1, 20))
 	  (set: $D100 to (random: 1, 100))


:: Start your Journey {"position":"1900,250","size":"100,100"}
You woke up early in the morning. There was a somberness to the day as there always was. For this colony was that of Myconid origin. It was known to The Continent's adventurers as Sporehaven Grove. In a thriving valley of sprawling wildlife and towering trees, vegetation, and fungi that block any sunlight, Myconids can truly thrive. You were one of them, having been recently appointed to be the high council . In close proximity to the colony's *Sovereign*.
    
	Each Myconid was assigned a role at birth, that they will unquestioningly follow throughout their lives. Many of your siblings were assigned to expand the infrastructure of the colony, to ingest specialized substances that distort their Mycellic bodies to best fit their assigned task. Becoming hulking behemoths to move around rubble and debris. All for *The Sovereign’s* plan. Whatever that may be. The whole colony aided *The Sovereign* in the fullest of capacities. For the purpose of the colony was that in which *The Sovereign* deemed fitting. Being far more powerful than any other Myconid, *The Sovereign* was truly fitting of such a title.
    
    You have a council meeting today. This'll be your first meeting since being appointed. This is high praise as you'll be in close proximity to *The Sovereign*. All Myconid of Sporehaven Grove do *The Sovereign's* bidding unquestioningly. But *The Sovereign's* not specialized like the other's. Lacking the strength of a Besphemore or the cunning intellect of Ceretet. What *The Sovereign* does have is free will. This sets it apart from all other Myconid in the colony. Although the Ceretet can think of endless possiblities and outcomes ultimately this is only to advise *The Sovereign* and NOT to refute it.
    
<img src="C:\Users\colto\Dropbox\Myconid-market.jpg"\>

[[Go to the Meeting]]


:: Tell the Hermit {"position":"1175,1200","size":"100,100"}
You decide to leave the dog with the Ogre for the time being, and head back to the Hermit. Here you tell him of the Cyclops in the cave with his trusted hound. He thanks you and rewards you generously. You leave him with the decision of what to do. You don't overstep your boundaries any further and don't ask what he'll do.

	The party goes on their way. You explore the continent for many years but always felt like there could've been more to your journey and think about your first ever quest. How you were indecisive and wondered how the Hermit handled the situation. You spend a lot of time reflecting...Maybe too much on what could've been. 
    
    
Ending

7/18


:: The Penterelle {"position":"700,700","size":"100,100"}
The party decides to seek out the aid of the Penterelle. Although cautious you're optimistic that they can help in this quest. As you traverse deep into Orlan's Thicket, you are reminded of Sporehaven. With the densely packed trees and vegetation this is a fitting environment for a Myconid colony. 
    
	You catch a whiff of a dense cluster of spores in the air. This helps lead the party to the Penterelle colony. Interesting enough its a smaller colony of only a few dozen Myconid. They are all rather small, no larger than an average sized dwarf like Brimly. This is interesting to the party as none of them have gone through body adaptations that Sporehaven colony has.
    
    The party is greeted warmly by Penterelle colony. Having a little celebration as they always take in adventurers who have gotten lost in the thickets. As the rest of the party gathers around with the Penterelle, you decide to meet with their Sovereign. Consistent with the rest of the colony it is a fraction of the size of an average Sporehaven grove Myconid. In your conversation you gain valuable information on how other Myconid colonies opporate.
    
    The Penterelle Sovereign says "$name you have grown strong since you've left the Sporehaven. I do not know how you've escaped Sporehaven but we are glad you've gained independence from Sporehaven's Sovereign. The Astarians of the mines of Skarsgarl are similar to us. Myconid should be one with nature, this is the natural state of our kind. The Sovereign of Sporehaven Grove has bastardized this concept. Expanding its colony to multiple mangnitudes that of Astaraia's or ours. $name we see you've been suppressed. You are a Sovereign yourself. Your friend has gracefully held off Sporehaven's Sovereign from calling you back to the colony. It is up to you to decide your path now. You are the first Mycnonid to have a name and to gain independence outside of their original Sovereign. It is not to the Astarian's or us to direct you on your next course of action but whatever you choose we will follow in your lead."
    
    Although this new information bewilders you, you still have the quest that should be completed. But your mine is busy with what should be done about the Sporehaven grove colony... You have two options you can urgently [[Unite the Myconid]] against Sporehaven or [[continue the quest]]?

<img src="C:\Users\colto\Dropbox\M1.png"\>

[[Explore the prints]]


:: Traps {"position":"2100,1150","size":"100,100"}
	The group doesn't know much about what they are working with. They set up traps randomly across town. Phospherous traps in citizens homes, holy enchantments encircling the graveyards, and hexes around everything else. Sadly this catches everything but the suspect.......

Locals, pets, wild animals, the Mayor, and old man Kurzheimer? 

Back to the drawing board? 

There are still witnesses and evidence that the party can look into.

[[Evidence]] 

[[Witnesses]]


:: Traps\  {"position":"1675,1275","size":"100,100"}
The group decides to lay out numerous traps. 
"There is strong evidence that the monster seems to be some sort of shapeshifter due to the eye witness reports. The slime could be an after effect of changes ones body chemistry." theorizes Lyssandra. 

"Brimly your phosphorus traps would be perfect for this" says Fried

"Nothing like Dwarven phosphorus" says Brimly

The group concludes that the monster must be hiding in the towns sewage system during the day. Thats also how its able to pop up in locations without having to travel and leave behind a trail of the residue. The party puts phospherous and gunpowder booby traps under manhole covers and sewer drains.

[[A conclusion to the investigation]]


:: Unite the Colonies Ending {"position":"2075,1750","size":"100,100"}
You ponder this decision for a long time. You know how The Sovereign runs the grove. You know its view on the other Myconid colonies. The Astarians of the mines of Skarsgarl and the Penterelle of Orlan's Thicket. You decide to travel to these near by kingdoms and meet with them. Although it takes hours of negotiating the peaceful clans of Penterelle and Astaria are won over by your good hearted nature and honesty. They never planned on any type of conquest. This was just fearmongering from The Sporehaven Grove's Sovereign. These communities are far from militarized in anyway. Simply living with nature as Myconid were suppose to. 
    After mobilizing the Myconid clans you wage a frontal assault on the Sporehaven Grove colony. Your party along with the Doppelganger aid in this fight. After a multi-day war and the ashes set, The Sovereign has fallen. You are appointed the new Soveriegn of The Grove and thou to rule far more fairly. Your friends and the Doppelganger are your new advisors and Myconid can now live without their modifications. $name usher's in a time of piece and tranquility.

<img src="C:\Users\colto\Dropbox\M2.png"\>

The End 

17/18 Ending


:: Unite the Myconid {"position":"550,1050","size":"100,100"}
The party merges with their Penterelle forces and quickly march over to the Astarians. They are quickly persuaded by your ability to already win over the Penterelle. With the aid of tne two Myconid colonies. The party trains under the two Sovereign's. You are able to gain a great deal of strength for your final battle. Lysandra and Aria learn a great deal of magic from the Myconid rot mages, and healing practices. While Brimly and Fried are introduced to Mycellic armor and weaponry.
    
    Eventually the time has come. Sporehaven knows about your preparation for this battle from Myconid scouts, and the Sovereign's telepathy. They have equally prepared for the day the colonies meet. When you meet on the battlefield it is truly a gruesome day. Rot mages wipe out legions of drones. Besphemore act as carriers for solider's with whole caravans and armories on their backs. Ceretet are at the Sporehaven colony directing troops in real time with the passage of spore's. Truly a grand sight. Ultimately your forces come out on top and you are exalted as the new king, the new Sovereign. Ushering in a new age of peace and just ruling. Your party members become your royal advisors and their was a new age of human influence in the grove's. With most of the world being newly introduced to Myconid products and trade routes.
    
    Ending 4/18


:: Uniting the Colonies Ending\  {"position":"1650,1725","size":"100,100"}
You ponder this decision for a long time. You know how The Sovereign runs the grove. You know its view on the other Myconid colonies. The Astarians of the mines of Skarsgarl and the Penterelle of Orlan's Thicket. You decide to travel to these near by kingdoms and meet with them. Although it takes hours of negotiating the peaceful clans of Penterelle and Astaria are won over by your good hearted nature and honesty. They never planned on any type of conquest. This was just fearmongering from The Sporehaven Grove's Sovereign. These communities are far from militarized in anyway. Simply living with nature as Myconid were suppose to. 
    
	After mobilizing the Myconid clans you wage a frontal assault on the Sporehaven Grove colony. Your party aids in this fight. After a multi-day war and the ashes set, The Sovereign has fallen. You are appointed the new Sovereign of the Grove and thou to rule far more fairly. Your party members are your new advisors and Myconid can now live without their modifications. $name usher's in a time of piece and tranquility.

<img src="C:\Users\colto\Dropbox\M2.png"\>

The End

15/18 Ending


:: Untitled Passage 1 {"position":"4350,2250","size":"100,100"}



:: Utilitarian {"position":"1900,500","size":"100,100"}
The meeting ends abruptly after vast amounts of discourse between the Ceretet. Oddly enough *The Sovereign* has you and the other newly appointed Myconid leave the council room for the final decision. Once the meeting ends you hear a warning from a Varnvetore at the front of the colony's gates. The Varnvetore with its powerful elongated cap dozens of feet above the grove sirens that a storm is coming. You head back to your house to prepare to brave the storm. The colony can handle a storm but what about unsuspecting vistors?
    (set: $war to false)(set: $unite to false)(set: $util to true)
    You hear a knocking on your door. After a slight hesitation it swings open with 4 bumbling oafs tumble into your small mushroom cottage. They introduce themselves with as Brimly Engelhardt, Aria Lucius, Fried Licht, and Lysandra Nachtraum a tiefling. Members of the adventurer's guild of Oftsburg they were on a bounty quest for collecting 20 leeches for a local doctor before getting caught out in the storm. Now you have a bag of 20 leeches on your well kept floors.......
    
    The colony of Sporehaven Grove is friendly with outsiders and does frequent trading with the nearby settlements. The guards let them past since *The Sovereign* didn't authorize against it. 
    
[[Newcomers]]


:: Violence {"position":"975,1200","size":"100,100"}
You chose this path for yourself. You get close to the Ogre, too close. The Ogre becomes frightend by your slowly growing body as its never looked eye to eye with any being before. Your hyphae grow out of your body like sentient tendrils, and shoot them into the abdomen of the Ogre. In the creature's final moments it was shocked and scared...
    
    Once the deed was done, everyone was in shock. This was the first time the party saw the capabilities of a Myconid. The dog weaping by the Ogre's side. Brimly picks up the dog and the party goes to leave the cave. At the entrance there is a cloaked shadowy figure. Cloaked in a green robe, with a metal face. Lysandra recognizes them first. It is a warlock, a patron to a corrupt god. Seeing your newly hulkish size he remarks in a foreign tongue,
    
    "A future ruler of Myconid? One who results to violence against the innocent is not fitting of such a title. You run from the authority that you will eventually become. You've made many decisions that have led to this path. I will stop you here. Remember a great ruler rules through uniting and not conquest."
    
    
    Before you can react you are obliterated faster than your body can react and adapt. Facing the power of the Warlock you attempt to absorb what you can of his power and burst from the sheer force. You are reduced to ashes and debris from his power. The last thing you remember is the shiny gleam of his mask. This is a cruel world and you'll have to help others so they'll aid you through your journey. 

<img src="C:\Users\colto\Dropbox\Doom.png"\>

    Ending 
    
    6/18


:: War Ending {"position":"2200,1725","size":"100,100"}
You ponder this decision for awhile. You know you can't wait forever. Lyssandra can only hold off The Sovereign for so long. You doubt the other Myconid colonies would aid a former member of Sporehaven Grove like yourself. You can't stand The Sovereign since you've gained sentience and independence you reflect on the way your kin were treated at the colony. Do you want to go to war with them? Although you bare no hatred to your fellow kin, The Sovereign justifies it all. 
	You mobolize everyone you've helped along your journey so far. Fried, Aria, Lyssandra, Brimly, the Doppelganger, The Hermit, other guild adventurers, and old man Kurzheimer even gives you aid. You wage a war on the colony in an attempt to overthrow The Sovereign but are swiftly defeated by his immense power, the hulking size of the Besephemore, and intellect of the Ceretet. Your attempt was noble but consider gaining more allies before the final decision.

<img src="C:\Users\colto\Dropbox\Sovereign.png"\>

The End

18/18 Ending


:: War Ending\  {"position":"1500,1675","size":"100,100"}
You ponder this decision for awhile. You know you can't wait forever. Lyssandra can only hold off The Sovereign for so long. You doubt the other Myconid colonies would aid a former member of Sporehaven Grove like yourself. You can't stand The Sovereign since you've gained sentience and independence. You reflect on the way your kin were treated at the colony. Do you want to go to war with them? Although you bare no hatred to your fellow kin, The Sovereign justifies it all. 
    	You mobolize everyone you've helped along your journey so far. Fried, Aria, Lyssandra, Brimly, The Hermit, other guild adventurers, and old man Kurzheimer even helps you out. You wage a war on the colony in an attempt to overthrow The Sovereign but are swiftly defeated by his immense power, the hulking size of the Besephemore, and intellect of the Ceretet. Your attempt was noble but consider gaining more allies before the final decision.

<img src="C:\Users\colto\Dropbox\Sovereign.png"\>

The End

14/18 Ending


:: Warmonger {"position":"2075,500","size":"100,100"}
The meeting ends abruptly after vast amounts of discourse between the Ceretet. Oddly enough *The Sovereign* has you and the other newly appointed Myconid leave the council room for the final decision. Once the meeting ends you hear a warning from a Varnvetore at the front of the colony's gates. The Varnvetore with its powerful elongated cap dozens of feet above the grove sirens that a storm is coming. You head back to your house to prepare to brave the storm. The colony can handle a storm but what about unsuspecting vistors?
    (set:$war to true)(set:$unite to false)(set: $util to false)
    You hear a knocking on your door. After a slight hesitation it swings open with 4 bumbling oafs tumble into your small mushroom cottage. They introduce themselves with as Brimly Engelhardt, Aria Lucius, Fried Licht, and Lysandra Nachtraum a tiefling. Members of the adventurer's guild of Oftsburg they were on a bounty quest for collecting 20 leeches for a local doctor before getting caught out in the storm. Now you have a bag of 20 leeches on your well kept floors.......
    
    The colony of Sporehaven Grove is friendly with outsiders and does frequent trading with the nearby settlements. The guards let them past since *The Sovereign* didn't authorize against it. 
    
[[Newcomers]]


:: Witnesses {"position":"1700,1150","size":"100,100"}
	The party elects to interview some witnesses. Not being hard to find as they have submitted their information to the guild in hopes that someone investigates the local murders. There are three different witnesses that the Guild has contact information for.

"The usual suspects" remarked Brimly, after looking at their descriptions.

"Stop it, these people have been through enough! This is no time for jokes!" shot back 
Aria.

	A widow to a bard that played at the local taverns. Her dimwitted husband had made many enemies and after one of his drunken performances in which he had mocked the taverns keep and wound up a bloodied mess in the alleyways outside.

	A countryside Hermit who's grey beard covers a majority of his rather short body. His eyebrows resemble two thick coated obsidian catepillars that cover his eyes. It makes you wonder how this old man can even travel on his own. But oddly enough there is a strange aura of capability about him. Once a great adventurer and a royal companion to the King of Caldea. He now spends his days on a patch of land granted to him by the King, right on the entrance of Orlan's Thicket. His mishap with the murders occured on his bimonthly visit to Oftburg to visit a young but talented Botanist. Sadly when he had arrived their floral shop was now a crime scene. With a strange residue across the floral shop.

	A tall uncanny man with a lanky appearance. He suspects that the cause of the murders may be unholy. He tells the party that he's seen spirits at night in dark cloaks with faces that resemble voids. Their victims are reminders have who the wraiths were while they were living. 

	Strangely enough there is something more terrifying about *this man* than any being you've ever come across. Except The Sovereign of course.
(set: $wit to true)

[[Evidence]] 

(If: $evi and $wit is true)[[Traps ]]
(If: $evi is false)[[Traps]]


:: continue the quest {"position":"750,875","size":"100,100"}
The Sovereign of the Penterelle understands. It is familiar with the will of an adventurer and is happy that you now have a sentience of your own. To not be influenced by the will of others. You seek advice on any clues that would help the party with the quest. The Penterelle do aid by pointing out that they have seen large crater like footprints along with dog tracks recently. They escort you to the trail where the Penterelle rangers first found the tracks and the party [[Explore the prints]]


:: dungeon {"position":"3100,1225","size":"100,100"}
With the aid of the Astarian's the party enters the final room of the dungeon. Here they are faced with a Cursed Oak. A massive distorted sentient tree. The oak explains itself,

	"I was once a traveler like you. Searching for this same treasure I now guard. But, I was cursed by one of my friends in a cruel twist of fate. Now I live in pain and anguish with this cursed body and I just reflect on my days as an adventurer. I can no longer control my body. Please put me out of my misery."
    
    Sympathizing with the former adventurer, your party swiftly deals with the atrocity the man has become. Ending his suffering in an instant reducing him to decomposed rot. The party mourns this fallen man of grace. You are fortunate for being so lucky. You take the treasure and return back to the guild. This first quest leaves an impact on your party and yourself for the rest of your days. You become successful adventurers but you never forget your first quest and how lucky you were making it out of that dungeon.
    
    Ending 11/18
    
    <img src="C:\Users\colto\Dropbox\Cursed Oak.png"\>


:: final boss {"position":"2950,1200","size":"100,100"}
Empowered with your new found abilities the party enters the final room of the dungeon. Here they are faced with a Cursed Oak. A massive distorted sentient tree. As he exclaims himself

	"I was once a traveler like you. Searching for this same treasure I now guard. But, I was cursed by one of my party members in a cruel set of fate. Now I live in pain and anguish with this cursed body and I just reflect back on my days as an adventurer. I can no longer control my body. Please put me out of my misery."
    
    Sympathizing with the former adventurer, you cast one of your new found spells on him. Ending his suffering in an instant reducing him to decomposed rot. The party mourns this fallen man of grace. You are fortunate for being so lucky. You take the treasure and return back to the guild. This first quest leaves an impact on your party and yourself for the rest of your days. You become successful adventurers but you never forget your first quest and how lucky you were making it out of that dungeon.
    
    Ending 10/18

<img src="C:\Users\colto\Dropbox\Cursed Oak.png"\>


:: mimic {"position":"2850,1075","size":"100,100"}
*Combat Check D6: $D6*

(if: $D6 is >2) [
The party works in tandem to combat the Mimic. Lysandra warns the party of its suprising strength. Brimly, Fried, and yourself quickly peel for the two backline spellcasters Aria and Lysandra. Blocking the Mimic's blitz. The aria uses a nature incantation to use the overgrowth from the mine's to bind the Mimic to the floor. With one clean chop Brimly is able to chop the being into two with his battleaxe. From its evaporated corpse the mimic drops a magical staff. 
	"It's all yours" the rest of the party says to you
    
    "The rest of the party has their own gear. You've been relying on your Myconid powers up till now. Take it!" says Lysandra.
    
    She touches your head and imparts into you the knowledge of new spells. No... Spells you knew but had forgotten...
    "You can now control the element of rot. As you should've always been able to. The Sovereign was scared of your potential and limited you. $name, you can now carve out your own path and not be bound to those limitations." says Lysandra.
    Empowered by your friends words and your new found abilities you continue onto the [[final boss]] of this dungeon.
    
<img src="C:\Users\colto\Dropbox\DS Mimic.png"\>
]


(if: $D6 is <3) [
	The party is simply overwhelmed by the creature. After revealing its guise as a chest it brings out its true form. A lumbering creature with long arms and legs. The party can not even react to this transformation. Aria and Lysandra the spell casters can not utter a single mantra or incantation in the time it takes the monster to close the gap between. One kick sends the two of them flying across the narrow dungeon passage. The rest of the party is quickly dealt with and this is where your journey ends. Consumed by this montrosity.
<img src="C:\Users\colto\Dropbox\DS Mimic.png"\>

Ending 9/18
]


:: path {"position":"3300,1200","size":"100,100"}
The party merges with their Astarian forces and quickly march over to the Penterelles. They are quickly persuaded by your ability to already win over the Astarian's. With the aid of the two Myconid colonies, the party learns and prepares under the two ruling Sovereign's. You are able to gain a great deal of strength for your final battle. Lysandra and Aria learn a great deal of magic from the Myconid rot mages, and healing practices. While Brimly and Fried are introduced to Mycellic armor and weaponry.
    
    Eventually the time has come. Sporehaven knows about your preparation for this battle from Myconid scouts, and The Sovereign's telepathy. They have equally prepared for the day the colonies meet. When you meet on the battlefield it is truly a gruesome day. Rot mages wipe out legions of drones. Besphemore act as carriers for solider's with whole caravans and armories on their backs. Ceretet are at the Sporehaven colony directing troops in real time with the passage of spore's. Truly a grand sight. Ultimately your forces come out on top and you are exalted as the new king, the new Sovereign. Ushering in a new age of peace and just ruling. Your party members become your royal advisors and their was a new age of human influence in the grove's. With most of the world being newly introduced to Myconid products and trade routes.
    
    Ending 12/18


:: StoryStylesheet [stylesheet]
tw-passage {text-align: center;}

tw-passage[tags~="sov"] {letter-spacing:10px;}
tw-link {
  color: #FFF89F;
}

.enchantment-link:hover,
tw-link:hover {
  color:#3BFF79;
}

tw-passage {
  font-family: Palatino;
}

tw-passage {
  font-size: 4vh; font-size: 4vw; font-size: 4vmin; line-height: normal;
}

tw-passage[tags~="sov"] {letter-spacing:15px;}
tw-link {
  color: #FFF89F;
}

tw-passage {(font:"monospace")[(v6m-print:(passage:)'s source)]\
(append:?sidebar)[(icon-fullscreen:)(icon-restart:)]\
  (enchant:?link,(t8n-depart:"dissolve")+(t8n-time:0.4s)))
  }