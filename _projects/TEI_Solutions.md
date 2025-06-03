---
name: TEI Solutions
tools: [Python, Beautiful Soup, Parsing]
image: assets/pngs/TEI.png
description: Converting HTML data to TEI 
custom_js:
  - vega.min
  - vega-lite.min
  - vega-embed.min
  - justcharts
---

## TEI Summary

The Text Encoding Initiative (TEI) Guidelines make recommendations about suitable ways of representing those features of textual resources which need to be identified explicitly in order to facilitate processing by computer programs. Essentially it is a standardized way of formatting text in order for programs to process it. Translating Text to TEI helps with cleansing the data for better computing.




# Convert html to xml


```python
# Open html document
document = open('Data/Clay.html', mode = 'r', encoding='utf-8')
document
```




    <_io.TextIOWrapper name='Data/Clay.html' mode='r' encoding='utf-8'>




```python
# Read html document
document.read()
```




    '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"\n"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n\n\n<div class="chapter">\n\n<h2><a name="chap10"></a>CLAY</h2>\n\n<p>\nThe matron had given her leave to go out as soon as the women&rsquo;s tea was\nover and Maria looked forward to her evening out. The kitchen was spick and\nspan: the cook said you could see yourself in the big copper boilers. The fire\nwas nice and bright and on one of the side-tables were four very big\nbarmbracks. These barmbracks seemed uncut; but if you went closer you would see\nthat they had been cut into long thick even slices and were ready to be handed\nround at tea. Maria had cut them herself.\n</p>\n\n<p>\nMaria was a very, very small person indeed but she had a very long nose and a\nvery long chin. She talked a little through her nose, always soothingly:\n<i>&ldquo;Yes, my dear,&rdquo;</i> and <i>&ldquo;No, my dear.&rdquo;</i> She\nwas always sent for when the women quarrelled over their tubs and always\nsucceeded in making peace. One day the matron had said to her:\n</p>\n\n<p>\n&ldquo;Maria, you are a veritable peace-maker!&rdquo;\n</p>\n\n<p>\nAnd the sub-matron and two of the Board ladies had heard the compliment. And\nGinger Mooney was always saying what she wouldn&rsquo;t do to the dummy who had\ncharge of the irons if it wasn&rsquo;t for Maria. Everyone was so fond of\nMaria.\n</p>\n\n<p>\nThe women would have their tea at six o&rsquo;clock and she would be able to\nget away before seven. From Ballsbridge to the Pillar, twenty minutes; from the\nPillar to Drumcondra, twenty minutes; and twenty minutes to buy the things. She\nwould be there before eight. She took out her purse with the silver clasps and\nread again the words <i>A Present from Belfast</i>. She was very fond of that\npurse because Joe had brought it to her five years before when he and Alphy had\ngone to Belfast on a Whit-Monday trip. In the purse were two half-crowns and\nsome coppers. She would have five shillings clear after paying tram fare. What\na nice evening they would have, all the children singing! Only she hoped that\nJoe wouldn&rsquo;t come in drunk. He was so different when he took any drink.\n</p>\n\n<p>\nOften he had wanted her to go and live with them; but she would have felt\nherself in the way (though Joe&rsquo;s wife was ever so nice with her) and she\nhad become accustomed to the life of the laundry. Joe was a good fellow. She\nhad nursed him and Alphy too; and Joe used often say:\n</p>\n\n<p>\n&ldquo;Mamma is mamma but Maria is my proper mother.&rdquo;\n</p>\n\n<p>\nAfter the break-up at home the boys had got her that position in the <i>Dublin\nby Lamplight</i> laundry, and she liked it. She used to have such a bad opinion\nof Protestants but now she thought they were very nice people, a little quiet\nand serious, but still very nice people to live with. Then she had her plants\nin the conservatory and she liked looking after them. She had lovely ferns and\nwax-plants and, whenever anyone came to visit her, she always gave the visitor\none or two slips from her conservatory. There was one thing she didn&rsquo;t\nlike and that was the tracts on the walks; but the matron was such a nice\nperson to deal with, so genteel.\n</p>\n\n<p>\nWhen the cook told her everything was ready she went into the women&rsquo;s\nroom and began to pull the big bell. In a few minutes the women began to come\nin by twos and threes, wiping their steaming hands in their petticoats and\npulling down the sleeves of their blouses over their red steaming arms. They\nsettled down before their huge mugs which the cook and the dummy filled up with\nhot tea, already mixed with milk and sugar in huge tin cans. Maria\nsuperintended the distribution of the barmbrack and saw that every woman got\nher four slices. There was a great deal of laughing and joking during the meal.\nLizzie Fleming said Maria was sure to get the ring and, though Fleming had said\nthat for so many Hallow Eves, Maria had to laugh and say she didn&rsquo;t want\nany ring or man either; and when she laughed her grey-green eyes sparkled with\ndisappointed shyness and the tip of her nose nearly met the tip of her chin.\nThen Ginger Mooney lifted up her mug of tea and proposed Maria&rsquo;s health\nwhile all the other women clattered with their mugs on the table, and said she\nwas sorry she hadn&rsquo;t a sup of porter to drink it in. And Maria laughed\nagain till the tip of her nose nearly met the tip of her chin and till her\nminute body nearly shook itself asunder because she knew that Mooney meant well\nthough, of course, she had the notions of a common woman.\n</p>\n\n<p>\nBut wasn&rsquo;t Maria glad when the women had finished their tea and the cook\nand the dummy had begun to clear away the tea-things! She went into her little\nbedroom and, remembering that the next morning was a mass morning, changed the\nhand of the alarm from seven to six. Then she took off her working skirt and\nher house-boots and laid her best skirt out on the bed and her tiny dress-boots\nbeside the foot of the bed. She changed her blouse too and, as she stood before\nthe mirror, she thought of how she used to dress for mass on Sunday morning\nwhen she was a young girl; and she looked with quaint affection at the\ndiminutive body which she had so often adorned. In spite of its years she found\nit a nice tidy little body.\n</p>\n\n<p>\nWhen she got outside the streets were shining with rain and she was glad of her\nold brown waterproof. The tram was full and she had to sit on the little stool\nat the end of the car, facing all the people, with her toes barely touching the\nfloor. She arranged in her mind all she was going to do and thought how much\nbetter it was to be independent and to have your own money in your pocket. She\nhoped they would have a nice evening. She was sure they would but she could not\nhelp thinking what a pity it was Alphy and Joe were not speaking. They were\nalways falling out now but when they were boys together they used to be the\nbest of friends: but such was life.\n</p>\n\n<p>\nShe got out of her tram at the Pillar and ferreted her way quickly among the\ncrowds. She went into Downes&rsquo;s cake-shop but the shop was so full of\npeople that it was a long time before she could get herself attended to. She\nbought a dozen of mixed penny cakes, and at last came out of the shop laden\nwith a big bag. Then she thought what else would she buy: she wanted to buy\nsomething really nice. They would be sure to have plenty of apples and nuts. It\nwas hard to know what to buy and all she could think of was cake. She decided\nto buy some plumcake but Downes&rsquo;s plumcake had not enough almond icing on\ntop of it so she went over to a shop in Henry Street. Here she was a long time\nin suiting herself and the stylish young lady behind the counter, who was\nevidently a little annoyed by her, asked her was it wedding-cake she wanted to\nbuy. That made Maria blush and smile at the young lady; but the young lady took\nit all very seriously and finally cut a thick slice of plumcake, parcelled it\nup and said:\n</p>\n\n<p>\n&ldquo;Two-and-four, please.&rdquo;\n</p>\n\n<p>\nShe thought she would have to stand in the Drumcondra tram because none of the\nyoung men seemed to notice her but an elderly gentleman made room for her. He\nwas a stout gentleman and he wore a brown hard hat; he had a square red face\nand a greyish moustache. Maria thought he was a colonel-looking gentleman and\nshe reflected how much more polite he was than the young men who simply stared\nstraight before them. The gentleman began to chat with her about Hallow Eve and\nthe rainy weather. He supposed the bag was full of good things for the little\nones and said it was only right that the youngsters should enjoy themselves\nwhile they were young. Maria agreed with him and favoured him with demure nods\nand hems. He was very nice with her, and when she was getting out at the Canal\nBridge she thanked him and bowed, and he bowed to her and raised his hat and\nsmiled agreeably, and while she was going up along the terrace, bending her\ntiny head under the rain, she thought how easy it was to know a gentleman even\nwhen he has a drop taken.\n</p>\n\n<p>\nEverybody said: <i>&ldquo;O, here&rsquo;s Maria!&rdquo;</i> when she came to\nJoe&rsquo;s house. Joe was there, having come home from business, and all the\nchildren had their Sunday dresses on. There were two big girls in from next\ndoor and games were going on. Maria gave the bag of cakes to the eldest boy,\nAlphy, to divide and Mrs Donnelly said it was too good of her to bring such a\nbig bag of cakes and made all the children say:\n</p>\n\n<p>\n&ldquo;Thanks, Maria.&rdquo;\n</p>\n\n<p>\nBut Maria said she had brought something special for papa and mamma, something\nthey would be sure to like, and she began to look for her plumcake. She tried\nin Downes&rsquo;s bag and then in the pockets of her waterproof and then on the\nhallstand but nowhere could she find it. Then she asked all the children had\nany of them eaten it&mdash;by mistake, of course&mdash;but the children all\nsaid no and looked as if they did not like to eat cakes if they were to be\naccused of stealing. Everybody had a solution for the mystery and Mrs Donnelly\nsaid it was plain that Maria had left it behind her in the tram. Maria,\nremembering how confused the gentleman with the greyish moustache had made her,\ncoloured with shame and vexation and disappointment. At the thought of the\nfailure of her little surprise and of the two and fourpence she had thrown away\nfor nothing she nearly cried outright.\n</p>\n\n<p>\nBut Joe said it didn&rsquo;t matter and made her sit down by the fire. He was\nvery nice with her. He told her all that went on in his office, repeating for\nher a smart answer which he had made to the manager. Maria did not understand\nwhy Joe laughed so much over the answer he had made but she said that the\nmanager must have been a very overbearing person to deal with. Joe said he\nwasn&rsquo;t so bad when you knew how to take him, that he was a decent sort so\nlong as you didn&rsquo;t rub him the wrong way. Mrs Donnelly played the piano\nfor the children and they danced and sang. Then the two next-door girls handed\nround the nuts. Nobody could find the nutcrackers and Joe was nearly getting\ncross over it and asked how did they expect Maria to crack nuts without a\nnutcracker. But Maria said she didn&rsquo;t like nuts and that they\nweren&rsquo;t to bother about her. Then Joe asked would she take a bottle of\nstout and Mrs Donnelly said there was port wine too in the house if she would\nprefer that. Maria said she would rather they didn&rsquo;t ask her to take\nanything: but Joe insisted.\n</p>\n\n<p>\nSo Maria let him have his way and they sat by the fire talking over old times\nand Maria thought she would put in a good word for Alphy. But Joe cried that\nGod might strike him stone dead if ever he spoke a word to his brother again\nand Maria said she was sorry she had mentioned the matter. Mrs Donnelly told\nher husband it was a great shame for him to speak that way of his own flesh and\nblood but Joe said that Alphy was no brother of his and there was nearly being\na row on the head of it. But Joe said he would not lose his temper on account\nof the night it was and asked his wife to open some more stout. The two\nnext-door girls had arranged some Hallow Eve games and soon everything was\nmerry again. Maria was delighted to see the children so merry and Joe and his\nwife in such good spirits. The next-door girls put some saucers on the table\nand then led the children up to the table, blindfold. One got the prayer-book\nand the other three got the water; and when one of the next-door girls got the\nring Mrs Donnelly shook her finger at the blushing girl as much as to say:\n<i>O, I know all about it!</i> They insisted then on blindfolding Maria and\nleading her up to the table to see what she would get; and, while they were\nputting on the bandage, Maria laughed and laughed again till the tip of her\nnose nearly met the tip of her chin.\n</p>\n\n<p>\nThey led her up to the table amid laughing and joking and she put her hand out\nin the air as she was told to do. She moved her hand about here and there in\nthe air and descended on one of the saucers. She felt a soft wet substance with\nher fingers and was surprised that nobody spoke or took off her bandage. There\nwas a pause for a few seconds; and then a great deal of scuffling and\nwhispering. Somebody said something about the garden, and at last Mrs Donnelly\nsaid something very cross to one of the next-door girls and told her to throw\nit out at once: that was no play. Maria understood that it was wrong that time\nand so she had to do it over again: and this time she got the prayer-book.\n</p>\n\n<p>\nAfter that Mrs Donnelly played Miss McCloud&rsquo;s Reel for the children and\nJoe made Maria take a glass of wine. Soon they were all quite merry again and\nMrs Donnelly said Maria would enter a convent before the year was out because\nshe had got the prayer-book. Maria had never seen Joe so nice to her as he was\nthat night, so full of pleasant talk and reminiscences. She said they were all\nvery good to her.\n</p>\n\n<p>\nAt last the children grew tired and sleepy and Joe asked Maria would she not\nsing some little song before she went, one of the old songs. Mrs Donnelly said\n<i>&ldquo;Do, please, Maria!&rdquo;</i> and so Maria had to get up and stand\nbeside the piano. Mrs Donnelly bade the children be quiet and listen to\nMaria&rsquo;s song. Then she played the prelude and said <i>&ldquo;Now,\nMaria!&rdquo;</i> and Maria, blushing very much began to sing in a tiny\nquavering voice. She sang <i>I Dreamt that I Dwelt</i>, and when she came to\nthe second verse she sang again:\n</p>\n\n<p class="poem">\n<i>I dreamt that I dwelt in marble halls<br />\n\xa0\xa0\xa0\xa0With vassals and serfs at my side<br />\nAnd of all who assembled within those walls<br />\n\xa0\xa0\xa0\xa0That I was the hope and the pride.<br />\nI had riches too great to count, could boast<br />\n\xa0\xa0\xa0\xa0Of a high ancestral name,<br />\nBut I also dreamt, which pleased me most,<br />\n\xa0\xa0\xa0\xa0That you loved me still the same.</i>\n</p>\n\n<p>\nBut no one tried to show her her mistake; and when she had ended her song Joe\nwas very much moved. He said that there was no time like the long ago and no\nmusic for him like poor old Balfe, whatever other people might say; and his\neyes filled up so much with tears that he could not find what he was looking\nfor and in the end he had to ask his wife to tell him where the corkscrew was.\n</p>\n\n</div><!--end chapter-->\n\n</body>\n</html>\n\n\n\n'




```python
# Installing lxml, if it hasn't been installed
# lxml is used for parsing and manipulating XML and HTML documents
!pip install lxml
```

    Requirement already satisfied: lxml in c:\users\colto\anaconda3\lib\site-packages (4.9.3)
    


```python
# Parse html document
from lxml import html
document = open('Data/Clay.html', mode = 'r', encoding='utf-8')
htmldoc = html.fromstring(document.read())
htmldoc
```




    <Element html at 0x137081ed900>




```python
# Open a output.xml file and write the element/document to an encoded string representation of its XML tree
from lxml import etree
open("Data/Clay.xml", 'wb').write(etree.tostring(htmldoc)) # "wb" for binary mode for xml files
```




    14591




```python
# Load the xml file
xml_document = open('Data/Clay.xml', mode = 'r')
xml_document.read()
```




    '<html xmlns="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" xml:lang="en">\n\n\n<body><div class="chapter">\n\n<h2><a name="chap10" id="chap10"></a>CLAY</h2>\n\n<p>\nThe matron had given her leave to go out as soon as the women&#8217;s tea was\nover and Maria looked forward to her evening out. The kitchen was spick and\nspan: the cook said you could see yourself in the big copper boilers. The fire\nwas nice and bright and on one of the side-tables were four very big\nbarmbracks. These barmbracks seemed uncut; but if you went closer you would see\nthat they had been cut into long thick even slices and were ready to be handed\nround at tea. Maria had cut them herself.\n</p>\n\n<p>\nMaria was a very, very small person indeed but she had a very long nose and a\nvery long chin. She talked a little through her nose, always soothingly:\n<i>&#8220;Yes, my dear,&#8221;</i> and <i>&#8220;No, my dear.&#8221;</i> She\nwas always sent for when the women quarrelled over their tubs and always\nsucceeded in making peace. One day the matron had said to her:\n</p>\n\n<p>\n&#8220;Maria, you are a veritable peace-maker!&#8221;\n</p>\n\n<p>\nAnd the sub-matron and two of the Board ladies had heard the compliment. And\nGinger Mooney was always saying what she wouldn&#8217;t do to the dummy who had\ncharge of the irons if it wasn&#8217;t for Maria. Everyone was so fond of\nMaria.\n</p>\n\n<p>\nThe women would have their tea at six o&#8217;clock and she would be able to\nget away before seven. From Ballsbridge to the Pillar, twenty minutes; from the\nPillar to Drumcondra, twenty minutes; and twenty minutes to buy the things. She\nwould be there before eight. She took out her purse with the silver clasps and\nread again the words <i>A Present from Belfast</i>. She was very fond of that\npurse because Joe had brought it to her five years before when he and Alphy had\ngone to Belfast on a Whit-Monday trip. In the purse were two half-crowns and\nsome coppers. She would have five shillings clear after paying tram fare. What\na nice evening they would have, all the children singing! Only she hoped that\nJoe wouldn&#8217;t come in drunk. He was so different when he took any drink.\n</p>\n\n<p>\nOften he had wanted her to go and live with them; but she would have felt\nherself in the way (though Joe&#8217;s wife was ever so nice with her) and she\nhad become accustomed to the life of the laundry. Joe was a good fellow. She\nhad nursed him and Alphy too; and Joe used often say:\n</p>\n\n<p>\n&#8220;Mamma is mamma but Maria is my proper mother.&#8221;\n</p>\n\n<p>\nAfter the break-up at home the boys had got her that position in the <i>Dublin\nby Lamplight</i> laundry, and she liked it. She used to have such a bad opinion\nof Protestants but now she thought they were very nice people, a little quiet\nand serious, but still very nice people to live with. Then she had her plants\nin the conservatory and she liked looking after them. She had lovely ferns and\nwax-plants and, whenever anyone came to visit her, she always gave the visitor\none or two slips from her conservatory. There was one thing she didn&#8217;t\nlike and that was the tracts on the walks; but the matron was such a nice\nperson to deal with, so genteel.\n</p>\n\n<p>\nWhen the cook told her everything was ready she went into the women&#8217;s\nroom and began to pull the big bell. In a few minutes the women began to come\nin by twos and threes, wiping their steaming hands in their petticoats and\npulling down the sleeves of their blouses over their red steaming arms. They\nsettled down before their huge mugs which the cook and the dummy filled up with\nhot tea, already mixed with milk and sugar in huge tin cans. Maria\nsuperintended the distribution of the barmbrack and saw that every woman got\nher four slices. There was a great deal of laughing and joking during the meal.\nLizzie Fleming said Maria was sure to get the ring and, though Fleming had said\nthat for so many Hallow Eves, Maria had to laugh and say she didn&#8217;t want\nany ring or man either; and when she laughed her grey-green eyes sparkled with\ndisappointed shyness and the tip of her nose nearly met the tip of her chin.\nThen Ginger Mooney lifted up her mug of tea and proposed Maria&#8217;s health\nwhile all the other women clattered with their mugs on the table, and said she\nwas sorry she hadn&#8217;t a sup of porter to drink it in. And Maria laughed\nagain till the tip of her nose nearly met the tip of her chin and till her\nminute body nearly shook itself asunder because she knew that Mooney meant well\nthough, of course, she had the notions of a common woman.\n</p>\n\n<p>\nBut wasn&#8217;t Maria glad when the women had finished their tea and the cook\nand the dummy had begun to clear away the tea-things! She went into her little\nbedroom and, remembering that the next morning was a mass morning, changed the\nhand of the alarm from seven to six. Then she took off her working skirt and\nher house-boots and laid her best skirt out on the bed and her tiny dress-boots\nbeside the foot of the bed. She changed her blouse too and, as she stood before\nthe mirror, she thought of how she used to dress for mass on Sunday morning\nwhen she was a young girl; and she looked with quaint affection at the\ndiminutive body which she had so often adorned. In spite of its years she found\nit a nice tidy little body.\n</p>\n\n<p>\nWhen she got outside the streets were shining with rain and she was glad of her\nold brown waterproof. The tram was full and she had to sit on the little stool\nat the end of the car, facing all the people, with her toes barely touching the\nfloor. She arranged in her mind all she was going to do and thought how much\nbetter it was to be independent and to have your own money in your pocket. She\nhoped they would have a nice evening. She was sure they would but she could not\nhelp thinking what a pity it was Alphy and Joe were not speaking. They were\nalways falling out now but when they were boys together they used to be the\nbest of friends: but such was life.\n</p>\n\n<p>\nShe got out of her tram at the Pillar and ferreted her way quickly among the\ncrowds. She went into Downes&#8217;s cake-shop but the shop was so full of\npeople that it was a long time before she could get herself attended to. She\nbought a dozen of mixed penny cakes, and at last came out of the shop laden\nwith a big bag. Then she thought what else would she buy: she wanted to buy\nsomething really nice. They would be sure to have plenty of apples and nuts. It\nwas hard to know what to buy and all she could think of was cake. She decided\nto buy some plumcake but Downes&#8217;s plumcake had not enough almond icing on\ntop of it so she went over to a shop in Henry Street. Here she was a long time\nin suiting herself and the stylish young lady behind the counter, who was\nevidently a little annoyed by her, asked her was it wedding-cake she wanted to\nbuy. That made Maria blush and smile at the young lady; but the young lady took\nit all very seriously and finally cut a thick slice of plumcake, parcelled it\nup and said:\n</p>\n\n<p>\n&#8220;Two-and-four, please.&#8221;\n</p>\n\n<p>\nShe thought she would have to stand in the Drumcondra tram because none of the\nyoung men seemed to notice her but an elderly gentleman made room for her. He\nwas a stout gentleman and he wore a brown hard hat; he had a square red face\nand a greyish moustache. Maria thought he was a colonel-looking gentleman and\nshe reflected how much more polite he was than the young men who simply stared\nstraight before them. The gentleman began to chat with her about Hallow Eve and\nthe rainy weather. He supposed the bag was full of good things for the little\nones and said it was only right that the youngsters should enjoy themselves\nwhile they were young. Maria agreed with him and favoured him with demure nods\nand hems. He was very nice with her, and when she was getting out at the Canal\nBridge she thanked him and bowed, and he bowed to her and raised his hat and\nsmiled agreeably, and while she was going up along the terrace, bending her\ntiny head under the rain, she thought how easy it was to know a gentleman even\nwhen he has a drop taken.\n</p>\n\n<p>\nEverybody said: <i>&#8220;O, here&#8217;s Maria!&#8221;</i> when she came to\nJoe&#8217;s house. Joe was there, having come home from business, and all the\nchildren had their Sunday dresses on. There were two big girls in from next\ndoor and games were going on. Maria gave the bag of cakes to the eldest boy,\nAlphy, to divide and Mrs Donnelly said it was too good of her to bring such a\nbig bag of cakes and made all the children say:\n</p>\n\n<p>\n&#8220;Thanks, Maria.&#8221;\n</p>\n\n<p>\nBut Maria said she had brought something special for papa and mamma, something\nthey would be sure to like, and she began to look for her plumcake. She tried\nin Downes&#8217;s bag and then in the pockets of her waterproof and then on the\nhallstand but nowhere could she find it. Then she asked all the children had\nany of them eaten it&#8212;by mistake, of course&#8212;but the children all\nsaid no and looked as if they did not like to eat cakes if they were to be\naccused of stealing. Everybody had a solution for the mystery and Mrs Donnelly\nsaid it was plain that Maria had left it behind her in the tram. Maria,\nremembering how confused the gentleman with the greyish moustache had made her,\ncoloured with shame and vexation and disappointment. At the thought of the\nfailure of her little surprise and of the two and fourpence she had thrown away\nfor nothing she nearly cried outright.\n</p>\n\n<p>\nBut Joe said it didn&#8217;t matter and made her sit down by the fire. He was\nvery nice with her. He told her all that went on in his office, repeating for\nher a smart answer which he had made to the manager. Maria did not understand\nwhy Joe laughed so much over the answer he had made but she said that the\nmanager must have been a very overbearing person to deal with. Joe said he\nwasn&#8217;t so bad when you knew how to take him, that he was a decent sort so\nlong as you didn&#8217;t rub him the wrong way. Mrs Donnelly played the piano\nfor the children and they danced and sang. Then the two next-door girls handed\nround the nuts. Nobody could find the nutcrackers and Joe was nearly getting\ncross over it and asked how did they expect Maria to crack nuts without a\nnutcracker. But Maria said she didn&#8217;t like nuts and that they\nweren&#8217;t to bother about her. Then Joe asked would she take a bottle of\nstout and Mrs Donnelly said there was port wine too in the house if she would\nprefer that. Maria said she would rather they didn&#8217;t ask her to take\nanything: but Joe insisted.\n</p>\n\n<p>\nSo Maria let him have his way and they sat by the fire talking over old times\nand Maria thought she would put in a good word for Alphy. But Joe cried that\nGod might strike him stone dead if ever he spoke a word to his brother again\nand Maria said she was sorry she had mentioned the matter. Mrs Donnelly told\nher husband it was a great shame for him to speak that way of his own flesh and\nblood but Joe said that Alphy was no brother of his and there was nearly being\na row on the head of it. But Joe said he would not lose his temper on account\nof the night it was and asked his wife to open some more stout. The two\nnext-door girls had arranged some Hallow Eve games and soon everything was\nmerry again. Maria was delighted to see the children so merry and Joe and his\nwife in such good spirits. The next-door girls put some saucers on the table\nand then led the children up to the table, blindfold. One got the prayer-book\nand the other three got the water; and when one of the next-door girls got the\nring Mrs Donnelly shook her finger at the blushing girl as much as to say:\n<i>O, I know all about it!</i> They insisted then on blindfolding Maria and\nleading her up to the table to see what she would get; and, while they were\nputting on the bandage, Maria laughed and laughed again till the tip of her\nnose nearly met the tip of her chin.\n</p>\n\n<p>\nThey led her up to the table amid laughing and joking and she put her hand out\nin the air as she was told to do. She moved her hand about here and there in\nthe air and descended on one of the saucers. She felt a soft wet substance with\nher fingers and was surprised that nobody spoke or took off her bandage. There\nwas a pause for a few seconds; and then a great deal of scuffling and\nwhispering. Somebody said something about the garden, and at last Mrs Donnelly\nsaid something very cross to one of the next-door girls and told her to throw\nit out at once: that was no play. Maria understood that it was wrong that time\nand so she had to do it over again: and this time she got the prayer-book.\n</p>\n\n<p>\nAfter that Mrs Donnelly played Miss McCloud&#8217;s Reel for the children and\nJoe made Maria take a glass of wine. Soon they were all quite merry again and\nMrs Donnelly said Maria would enter a convent before the year was out because\nshe had got the prayer-book. Maria had never seen Joe so nice to her as he was\nthat night, so full of pleasant talk and reminiscences. She said they were all\nvery good to her.\n</p>\n\n<p>\nAt last the children grew tired and sleepy and Joe asked Maria would she not\nsing some little song before she went, one of the old songs. Mrs Donnelly said\n<i>&#8220;Do, please, Maria!&#8221;</i> and so Maria had to get up and stand\nbeside the piano. Mrs Donnelly bade the children be quiet and listen to\nMaria&#8217;s song. Then she played the prelude and said <i>&#8220;Now,\nMaria!&#8221;</i> and Maria, blushing very much began to sing in a tiny\nquavering voice. She sang <i>I Dreamt that I Dwelt</i>, and when she came to\nthe second verse she sang again:\n</p>\n\n<p class="poem">\n<i>I dreamt that I dwelt in marble halls<br />\n&#160;&#160;&#160;&#160;With vassals and serfs at my side<br />\nAnd of all who assembled within those walls<br />\n&#160;&#160;&#160;&#160;That I was the hope and the pride.<br />\nI had riches too great to count, could boast<br />\n&#160;&#160;&#160;&#160;Of a high ancestral name,<br />\nBut I also dreamt, which pleased me most,<br />\n&#160;&#160;&#160;&#160;That you loved me still the same.</i>\n</p>\n\n<p>\nBut no one tried to show her her mistake; and when she had ended her song Joe\nwas very much moved. He said that there was no time like the long ago and no\nmusic for him like poor old Balfe, whatever other people might say; and his\neyes filled up so much with tears that he could not find what he was looking\nfor and in the end he had to ask his wife to tell him where the corkscrew was.\n</p>\n\n</div><!--end chapter-->\n\n</body>\n</html>'




```python
# Use BeautifulSoup to parse the xml
from bs4 import BeautifulSoup
xml_document = open('Data/Clay.xml', mode = 'r')
soup = BeautifulSoup(xml_document, 'lxml')
soup
```




    <html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">
    <body><div class="chapter">
    <h2><a id="chap10" name="chap10"></a>CLAY</h2>
    <p>
    The matron had given her leave to go out as soon as the women’s tea was
    over and Maria looked forward to her evening out. The kitchen was spick and
    span: the cook said you could see yourself in the big copper boilers. The fire
    was nice and bright and on one of the side-tables were four very big
    barmbracks. These barmbracks seemed uncut; but if you went closer you would see
    that they had been cut into long thick even slices and were ready to be handed
    round at tea. Maria had cut them herself.
    </p>
    <p>
    Maria was a very, very small person indeed but she had a very long nose and a
    very long chin. She talked a little through her nose, always soothingly:
    <i>“Yes, my dear,”</i> and <i>“No, my dear.”</i> She
    was always sent for when the women quarrelled over their tubs and always
    succeeded in making peace. One day the matron had said to her:
    </p>
    <p>
    “Maria, you are a veritable peace-maker!”
    </p>
    <p>
    And the sub-matron and two of the Board ladies had heard the compliment. And
    Ginger Mooney was always saying what she wouldn’t do to the dummy who had
    charge of the irons if it wasn’t for Maria. Everyone was so fond of
    Maria.
    </p>
    <p>
    The women would have their tea at six o’clock and she would be able to
    get away before seven. From Ballsbridge to the Pillar, twenty minutes; from the
    Pillar to Drumcondra, twenty minutes; and twenty minutes to buy the things. She
    would be there before eight. She took out her purse with the silver clasps and
    read again the words <i>A Present from Belfast</i>. She was very fond of that
    purse because Joe had brought it to her five years before when he and Alphy had
    gone to Belfast on a Whit-Monday trip. In the purse were two half-crowns and
    some coppers. She would have five shillings clear after paying tram fare. What
    a nice evening they would have, all the children singing! Only she hoped that
    Joe wouldn’t come in drunk. He was so different when he took any drink.
    </p>
    <p>
    Often he had wanted her to go and live with them; but she would have felt
    herself in the way (though Joe’s wife was ever so nice with her) and she
    had become accustomed to the life of the laundry. Joe was a good fellow. She
    had nursed him and Alphy too; and Joe used often say:
    </p>
    <p>
    “Mamma is mamma but Maria is my proper mother.”
    </p>
    <p>
    After the break-up at home the boys had got her that position in the <i>Dublin
    by Lamplight</i> laundry, and she liked it. She used to have such a bad opinion
    of Protestants but now she thought they were very nice people, a little quiet
    and serious, but still very nice people to live with. Then she had her plants
    in the conservatory and she liked looking after them. She had lovely ferns and
    wax-plants and, whenever anyone came to visit her, she always gave the visitor
    one or two slips from her conservatory. There was one thing she didn’t
    like and that was the tracts on the walks; but the matron was such a nice
    person to deal with, so genteel.
    </p>
    <p>
    When the cook told her everything was ready she went into the women’s
    room and began to pull the big bell. In a few minutes the women began to come
    in by twos and threes, wiping their steaming hands in their petticoats and
    pulling down the sleeves of their blouses over their red steaming arms. They
    settled down before their huge mugs which the cook and the dummy filled up with
    hot tea, already mixed with milk and sugar in huge tin cans. Maria
    superintended the distribution of the barmbrack and saw that every woman got
    her four slices. There was a great deal of laughing and joking during the meal.
    Lizzie Fleming said Maria was sure to get the ring and, though Fleming had said
    that for so many Hallow Eves, Maria had to laugh and say she didn’t want
    any ring or man either; and when she laughed her grey-green eyes sparkled with
    disappointed shyness and the tip of her nose nearly met the tip of her chin.
    Then Ginger Mooney lifted up her mug of tea and proposed Maria’s health
    while all the other women clattered with their mugs on the table, and said she
    was sorry she hadn’t a sup of porter to drink it in. And Maria laughed
    again till the tip of her nose nearly met the tip of her chin and till her
    minute body nearly shook itself asunder because she knew that Mooney meant well
    though, of course, she had the notions of a common woman.
    </p>
    <p>
    But wasn’t Maria glad when the women had finished their tea and the cook
    and the dummy had begun to clear away the tea-things! She went into her little
    bedroom and, remembering that the next morning was a mass morning, changed the
    hand of the alarm from seven to six. Then she took off her working skirt and
    her house-boots and laid her best skirt out on the bed and her tiny dress-boots
    beside the foot of the bed. She changed her blouse too and, as she stood before
    the mirror, she thought of how she used to dress for mass on Sunday morning
    when she was a young girl; and she looked with quaint affection at the
    diminutive body which she had so often adorned. In spite of its years she found
    it a nice tidy little body.
    </p>
    <p>
    When she got outside the streets were shining with rain and she was glad of her
    old brown waterproof. The tram was full and she had to sit on the little stool
    at the end of the car, facing all the people, with her toes barely touching the
    floor. She arranged in her mind all she was going to do and thought how much
    better it was to be independent and to have your own money in your pocket. She
    hoped they would have a nice evening. She was sure they would but she could not
    help thinking what a pity it was Alphy and Joe were not speaking. They were
    always falling out now but when they were boys together they used to be the
    best of friends: but such was life.
    </p>
    <p>
    She got out of her tram at the Pillar and ferreted her way quickly among the
    crowds. She went into Downes’s cake-shop but the shop was so full of
    people that it was a long time before she could get herself attended to. She
    bought a dozen of mixed penny cakes, and at last came out of the shop laden
    with a big bag. Then she thought what else would she buy: she wanted to buy
    something really nice. They would be sure to have plenty of apples and nuts. It
    was hard to know what to buy and all she could think of was cake. She decided
    to buy some plumcake but Downes’s plumcake had not enough almond icing on
    top of it so she went over to a shop in Henry Street. Here she was a long time
    in suiting herself and the stylish young lady behind the counter, who was
    evidently a little annoyed by her, asked her was it wedding-cake she wanted to
    buy. That made Maria blush and smile at the young lady; but the young lady took
    it all very seriously and finally cut a thick slice of plumcake, parcelled it
    up and said:
    </p>
    <p>
    “Two-and-four, please.”
    </p>
    <p>
    She thought she would have to stand in the Drumcondra tram because none of the
    young men seemed to notice her but an elderly gentleman made room for her. He
    was a stout gentleman and he wore a brown hard hat; he had a square red face
    and a greyish moustache. Maria thought he was a colonel-looking gentleman and
    she reflected how much more polite he was than the young men who simply stared
    straight before them. The gentleman began to chat with her about Hallow Eve and
    the rainy weather. He supposed the bag was full of good things for the little
    ones and said it was only right that the youngsters should enjoy themselves
    while they were young. Maria agreed with him and favoured him with demure nods
    and hems. He was very nice with her, and when she was getting out at the Canal
    Bridge she thanked him and bowed, and he bowed to her and raised his hat and
    smiled agreeably, and while she was going up along the terrace, bending her
    tiny head under the rain, she thought how easy it was to know a gentleman even
    when he has a drop taken.
    </p>
    <p>
    Everybody said: <i>“O, here’s Maria!”</i> when she came to
    Joe’s house. Joe was there, having come home from business, and all the
    children had their Sunday dresses on. There were two big girls in from next
    door and games were going on. Maria gave the bag of cakes to the eldest boy,
    Alphy, to divide and Mrs Donnelly said it was too good of her to bring such a
    big bag of cakes and made all the children say:
    </p>
    <p>
    “Thanks, Maria.”
    </p>
    <p>
    But Maria said she had brought something special for papa and mamma, something
    they would be sure to like, and she began to look for her plumcake. She tried
    in Downes’s bag and then in the pockets of her waterproof and then on the
    hallstand but nowhere could she find it. Then she asked all the children had
    any of them eaten it—by mistake, of course—but the children all
    said no and looked as if they did not like to eat cakes if they were to be
    accused of stealing. Everybody had a solution for the mystery and Mrs Donnelly
    said it was plain that Maria had left it behind her in the tram. Maria,
    remembering how confused the gentleman with the greyish moustache had made her,
    coloured with shame and vexation and disappointment. At the thought of the
    failure of her little surprise and of the two and fourpence she had thrown away
    for nothing she nearly cried outright.
    </p>
    <p>
    But Joe said it didn’t matter and made her sit down by the fire. He was
    very nice with her. He told her all that went on in his office, repeating for
    her a smart answer which he had made to the manager. Maria did not understand
    why Joe laughed so much over the answer he had made but she said that the
    manager must have been a very overbearing person to deal with. Joe said he
    wasn’t so bad when you knew how to take him, that he was a decent sort so
    long as you didn’t rub him the wrong way. Mrs Donnelly played the piano
    for the children and they danced and sang. Then the two next-door girls handed
    round the nuts. Nobody could find the nutcrackers and Joe was nearly getting
    cross over it and asked how did they expect Maria to crack nuts without a
    nutcracker. But Maria said she didn’t like nuts and that they
    weren’t to bother about her. Then Joe asked would she take a bottle of
    stout and Mrs Donnelly said there was port wine too in the house if she would
    prefer that. Maria said she would rather they didn’t ask her to take
    anything: but Joe insisted.
    </p>
    <p>
    So Maria let him have his way and they sat by the fire talking over old times
    and Maria thought she would put in a good word for Alphy. But Joe cried that
    God might strike him stone dead if ever he spoke a word to his brother again
    and Maria said she was sorry she had mentioned the matter. Mrs Donnelly told
    her husband it was a great shame for him to speak that way of his own flesh and
    blood but Joe said that Alphy was no brother of his and there was nearly being
    a row on the head of it. But Joe said he would not lose his temper on account
    of the night it was and asked his wife to open some more stout. The two
    next-door girls had arranged some Hallow Eve games and soon everything was
    merry again. Maria was delighted to see the children so merry and Joe and his
    wife in such good spirits. The next-door girls put some saucers on the table
    and then led the children up to the table, blindfold. One got the prayer-book
    and the other three got the water; and when one of the next-door girls got the
    ring Mrs Donnelly shook her finger at the blushing girl as much as to say:
    <i>O, I know all about it!</i> They insisted then on blindfolding Maria and
    leading her up to the table to see what she would get; and, while they were
    putting on the bandage, Maria laughed and laughed again till the tip of her
    nose nearly met the tip of her chin.
    </p>
    <p>
    They led her up to the table amid laughing and joking and she put her hand out
    in the air as she was told to do. She moved her hand about here and there in
    the air and descended on one of the saucers. She felt a soft wet substance with
    her fingers and was surprised that nobody spoke or took off her bandage. There
    was a pause for a few seconds; and then a great deal of scuffling and
    whispering. Somebody said something about the garden, and at last Mrs Donnelly
    said something very cross to one of the next-door girls and told her to throw
    it out at once: that was no play. Maria understood that it was wrong that time
    and so she had to do it over again: and this time she got the prayer-book.
    </p>
    <p>
    After that Mrs Donnelly played Miss McCloud’s Reel for the children and
    Joe made Maria take a glass of wine. Soon they were all quite merry again and
    Mrs Donnelly said Maria would enter a convent before the year was out because
    she had got the prayer-book. Maria had never seen Joe so nice to her as he was
    that night, so full of pleasant talk and reminiscences. She said they were all
    very good to her.
    </p>
    <p>
    At last the children grew tired and sleepy and Joe asked Maria would she not
    sing some little song before she went, one of the old songs. Mrs Donnelly said
    <i>“Do, please, Maria!”</i> and so Maria had to get up and stand
    beside the piano. Mrs Donnelly bade the children be quiet and listen to
    Maria’s song. Then she played the prelude and said <i>“Now,
    Maria!”</i> and Maria, blushing very much began to sing in a tiny
    quavering voice. She sang <i>I Dreamt that I Dwelt</i>, and when she came to
    the second verse she sang again:
    </p>
    <p class="poem">
    <i>I dreamt that I dwelt in marble halls<br/>
        With vassals and serfs at my side<br/>
    And of all who assembled within those walls<br/>
        That I was the hope and the pride.<br/>
    I had riches too great to count, could boast<br/>
        Of a high ancestral name,<br/>
    But I also dreamt, which pleased me most,<br/>
        That you loved me still the same.</i>
    </p>
    <p>
    But no one tried to show her her mistake; and when she had ended her song Joe
    was very much moved. He said that there was no time like the long ago and no
    music for him like poor old Balfe, whatever other people might say; and his
    eyes filled up so much with tears that he could not find what he was looking
    for and in the end he had to ask his wife to tell him where the corkscrew was.
    </p>
    </div><!--end chapter-->
    </body>
    </html>




```python
# Prettify the parsed xml
print(soup.prettify())
```

    <html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">
     <body>
      <div class="chapter">
       <h2>
        <a id="chap10" name="chap10">
        </a>
        CLAY
       </h2>
       <p>
        The matron had given her leave to go out as soon as the women’s tea was
    over and Maria looked forward to her evening out. The kitchen was spick and
    span: the cook said you could see yourself in the big copper boilers. The fire
    was nice and bright and on one of the side-tables were four very big
    barmbracks. These barmbracks seemed uncut; but if you went closer you would see
    that they had been cut into long thick even slices and were ready to be handed
    round at tea. Maria had cut them herself.
       </p>
       <p>
        Maria was a very, very small person indeed but she had a very long nose and a
    very long chin. She talked a little through her nose, always soothingly:
        <i>
         “Yes, my dear,”
        </i>
        and
        <i>
         “No, my dear.”
        </i>
        She
    was always sent for when the women quarrelled over their tubs and always
    succeeded in making peace. One day the matron had said to her:
       </p>
       <p>
        “Maria, you are a veritable peace-maker!”
       </p>
       <p>
        And the sub-matron and two of the Board ladies had heard the compliment. And
    Ginger Mooney was always saying what she wouldn’t do to the dummy who had
    charge of the irons if it wasn’t for Maria. Everyone was so fond of
    Maria.
       </p>
       <p>
        The women would have their tea at six o’clock and she would be able to
    get away before seven. From Ballsbridge to the Pillar, twenty minutes; from the
    Pillar to Drumcondra, twenty minutes; and twenty minutes to buy the things. She
    would be there before eight. She took out her purse with the silver clasps and
    read again the words
        <i>
         A Present from Belfast
        </i>
        . She was very fond of that
    purse because Joe had brought it to her five years before when he and Alphy had
    gone to Belfast on a Whit-Monday trip. In the purse were two half-crowns and
    some coppers. She would have five shillings clear after paying tram fare. What
    a nice evening they would have, all the children singing! Only she hoped that
    Joe wouldn’t come in drunk. He was so different when he took any drink.
       </p>
       <p>
        Often he had wanted her to go and live with them; but she would have felt
    herself in the way (though Joe’s wife was ever so nice with her) and she
    had become accustomed to the life of the laundry. Joe was a good fellow. She
    had nursed him and Alphy too; and Joe used often say:
       </p>
       <p>
        “Mamma is mamma but Maria is my proper mother.”
       </p>
       <p>
        After the break-up at home the boys had got her that position in the
        <i>
         Dublin
    by Lamplight
        </i>
        laundry, and she liked it. She used to have such a bad opinion
    of Protestants but now she thought they were very nice people, a little quiet
    and serious, but still very nice people to live with. Then she had her plants
    in the conservatory and she liked looking after them. She had lovely ferns and
    wax-plants and, whenever anyone came to visit her, she always gave the visitor
    one or two slips from her conservatory. There was one thing she didn’t
    like and that was the tracts on the walks; but the matron was such a nice
    person to deal with, so genteel.
       </p>
       <p>
        When the cook told her everything was ready she went into the women’s
    room and began to pull the big bell. In a few minutes the women began to come
    in by twos and threes, wiping their steaming hands in their petticoats and
    pulling down the sleeves of their blouses over their red steaming arms. They
    settled down before their huge mugs which the cook and the dummy filled up with
    hot tea, already mixed with milk and sugar in huge tin cans. Maria
    superintended the distribution of the barmbrack and saw that every woman got
    her four slices. There was a great deal of laughing and joking during the meal.
    Lizzie Fleming said Maria was sure to get the ring and, though Fleming had said
    that for so many Hallow Eves, Maria had to laugh and say she didn’t want
    any ring or man either; and when she laughed her grey-green eyes sparkled with
    disappointed shyness and the tip of her nose nearly met the tip of her chin.
    Then Ginger Mooney lifted up her mug of tea and proposed Maria’s health
    while all the other women clattered with their mugs on the table, and said she
    was sorry she hadn’t a sup of porter to drink it in. And Maria laughed
    again till the tip of her nose nearly met the tip of her chin and till her
    minute body nearly shook itself asunder because she knew that Mooney meant well
    though, of course, she had the notions of a common woman.
       </p>
       <p>
        But wasn’t Maria glad when the women had finished their tea and the cook
    and the dummy had begun to clear away the tea-things! She went into her little
    bedroom and, remembering that the next morning was a mass morning, changed the
    hand of the alarm from seven to six. Then she took off her working skirt and
    her house-boots and laid her best skirt out on the bed and her tiny dress-boots
    beside the foot of the bed. She changed her blouse too and, as she stood before
    the mirror, she thought of how she used to dress for mass on Sunday morning
    when she was a young girl; and she looked with quaint affection at the
    diminutive body which she had so often adorned. In spite of its years she found
    it a nice tidy little body.
       </p>
       <p>
        When she got outside the streets were shining with rain and she was glad of her
    old brown waterproof. The tram was full and she had to sit on the little stool
    at the end of the car, facing all the people, with her toes barely touching the
    floor. She arranged in her mind all she was going to do and thought how much
    better it was to be independent and to have your own money in your pocket. She
    hoped they would have a nice evening. She was sure they would but she could not
    help thinking what a pity it was Alphy and Joe were not speaking. They were
    always falling out now but when they were boys together they used to be the
    best of friends: but such was life.
       </p>
       <p>
        She got out of her tram at the Pillar and ferreted her way quickly among the
    crowds. She went into Downes’s cake-shop but the shop was so full of
    people that it was a long time before she could get herself attended to. She
    bought a dozen of mixed penny cakes, and at last came out of the shop laden
    with a big bag. Then she thought what else would she buy: she wanted to buy
    something really nice. They would be sure to have plenty of apples and nuts. It
    was hard to know what to buy and all she could think of was cake. She decided
    to buy some plumcake but Downes’s plumcake had not enough almond icing on
    top of it so she went over to a shop in Henry Street. Here she was a long time
    in suiting herself and the stylish young lady behind the counter, who was
    evidently a little annoyed by her, asked her was it wedding-cake she wanted to
    buy. That made Maria blush and smile at the young lady; but the young lady took
    it all very seriously and finally cut a thick slice of plumcake, parcelled it
    up and said:
       </p>
       <p>
        “Two-and-four, please.”
       </p>
       <p>
        She thought she would have to stand in the Drumcondra tram because none of the
    young men seemed to notice her but an elderly gentleman made room for her. He
    was a stout gentleman and he wore a brown hard hat; he had a square red face
    and a greyish moustache. Maria thought he was a colonel-looking gentleman and
    she reflected how much more polite he was than the young men who simply stared
    straight before them. The gentleman began to chat with her about Hallow Eve and
    the rainy weather. He supposed the bag was full of good things for the little
    ones and said it was only right that the youngsters should enjoy themselves
    while they were young. Maria agreed with him and favoured him with demure nods
    and hems. He was very nice with her, and when she was getting out at the Canal
    Bridge she thanked him and bowed, and he bowed to her and raised his hat and
    smiled agreeably, and while she was going up along the terrace, bending her
    tiny head under the rain, she thought how easy it was to know a gentleman even
    when he has a drop taken.
       </p>
       <p>
        Everybody said:
        <i>
         “O, here’s Maria!”
        </i>
        when she came to
    Joe’s house. Joe was there, having come home from business, and all the
    children had their Sunday dresses on. There were two big girls in from next
    door and games were going on. Maria gave the bag of cakes to the eldest boy,
    Alphy, to divide and Mrs Donnelly said it was too good of her to bring such a
    big bag of cakes and made all the children say:
       </p>
       <p>
        “Thanks, Maria.”
       </p>
       <p>
        But Maria said she had brought something special for papa and mamma, something
    they would be sure to like, and she began to look for her plumcake. She tried
    in Downes’s bag and then in the pockets of her waterproof and then on the
    hallstand but nowhere could she find it. Then she asked all the children had
    any of them eaten it—by mistake, of course—but the children all
    said no and looked as if they did not like to eat cakes if they were to be
    accused of stealing. Everybody had a solution for the mystery and Mrs Donnelly
    said it was plain that Maria had left it behind her in the tram. Maria,
    remembering how confused the gentleman with the greyish moustache had made her,
    coloured with shame and vexation and disappointment. At the thought of the
    failure of her little surprise and of the two and fourpence she had thrown away
    for nothing she nearly cried outright.
       </p>
       <p>
        But Joe said it didn’t matter and made her sit down by the fire. He was
    very nice with her. He told her all that went on in his office, repeating for
    her a smart answer which he had made to the manager. Maria did not understand
    why Joe laughed so much over the answer he had made but she said that the
    manager must have been a very overbearing person to deal with. Joe said he
    wasn’t so bad when you knew how to take him, that he was a decent sort so
    long as you didn’t rub him the wrong way. Mrs Donnelly played the piano
    for the children and they danced and sang. Then the two next-door girls handed
    round the nuts. Nobody could find the nutcrackers and Joe was nearly getting
    cross over it and asked how did they expect Maria to crack nuts without a
    nutcracker. But Maria said she didn’t like nuts and that they
    weren’t to bother about her. Then Joe asked would she take a bottle of
    stout and Mrs Donnelly said there was port wine too in the house if she would
    prefer that. Maria said she would rather they didn’t ask her to take
    anything: but Joe insisted.
       </p>
       <p>
        So Maria let him have his way and they sat by the fire talking over old times
    and Maria thought she would put in a good word for Alphy. But Joe cried that
    God might strike him stone dead if ever he spoke a word to his brother again
    and Maria said she was sorry she had mentioned the matter. Mrs Donnelly told
    her husband it was a great shame for him to speak that way of his own flesh and
    blood but Joe said that Alphy was no brother of his and there was nearly being
    a row on the head of it. But Joe said he would not lose his temper on account
    of the night it was and asked his wife to open some more stout. The two
    next-door girls had arranged some Hallow Eve games and soon everything was
    merry again. Maria was delighted to see the children so merry and Joe and his
    wife in such good spirits. The next-door girls put some saucers on the table
    and then led the children up to the table, blindfold. One got the prayer-book
    and the other three got the water; and when one of the next-door girls got the
    ring Mrs Donnelly shook her finger at the blushing girl as much as to say:
        <i>
         O, I know all about it!
        </i>
        They insisted then on blindfolding Maria and
    leading her up to the table to see what she would get; and, while they were
    putting on the bandage, Maria laughed and laughed again till the tip of her
    nose nearly met the tip of her chin.
       </p>
       <p>
        They led her up to the table amid laughing and joking and she put her hand out
    in the air as she was told to do. She moved her hand about here and there in
    the air and descended on one of the saucers. She felt a soft wet substance with
    her fingers and was surprised that nobody spoke or took off her bandage. There
    was a pause for a few seconds; and then a great deal of scuffling and
    whispering. Somebody said something about the garden, and at last Mrs Donnelly
    said something very cross to one of the next-door girls and told her to throw
    it out at once: that was no play. Maria understood that it was wrong that time
    and so she had to do it over again: and this time she got the prayer-book.
       </p>
       <p>
        After that Mrs Donnelly played Miss McCloud’s Reel for the children and
    Joe made Maria take a glass of wine. Soon they were all quite merry again and
    Mrs Donnelly said Maria would enter a convent before the year was out because
    she had got the prayer-book. Maria had never seen Joe so nice to her as he was
    that night, so full of pleasant talk and reminiscences. She said they were all
    very good to her.
       </p>
       <p>
        At last the children grew tired and sleepy and Joe asked Maria would she not
    sing some little song before she went, one of the old songs. Mrs Donnelly said
        <i>
         “Do, please, Maria!”
        </i>
        and so Maria had to get up and stand
    beside the piano. Mrs Donnelly bade the children be quiet and listen to
    Maria’s song. Then she played the prelude and said
        <i>
         “Now,
    Maria!”
        </i>
        and Maria, blushing very much began to sing in a tiny
    quavering voice. She sang
        <i>
         I Dreamt that I Dwelt
        </i>
        , and when she came to
    the second verse she sang again:
       </p>
       <p class="poem">
        <i>
         I dreamt that I dwelt in marble halls
         <br/>
         With vassals and serfs at my side
         <br/>
         And of all who assembled within those walls
         <br/>
         That I was the hope and the pride.
         <br/>
         I had riches too great to count, could boast
         <br/>
         Of a high ancestral name,
         <br/>
         But I also dreamt, which pleased me most,
         <br/>
         That you loved me still the same.
        </i>
       </p>
       <p>
        But no one tried to show her her mistake; and when she had ended her song Joe
    was very much moved. He said that there was no time like the long ago and no
    music for him like poor old Balfe, whatever other people might say; and his
    eyes filled up so much with tears that he could not find what he was looking
    for and in the end he had to ask his wife to tell him where the corkscrew was.
       </p>
      </div>
      <!--end chapter-->
     </body>
    </html>
    
    

# Converting to TEI Following the TEI guidelines


```python
# Update root element to align with TEI guidelines (Chapter 2)
root = soup.find()
root.name = 'TEI'
del root['lang']
del root['xml:lang']
root['xmlns'] = 'http://www.tei-c.org/ns/1.0'
root
```




    <TEI xmlns="http://www.tei-c.org/ns/1.0">
    <body><div class="chapter">
    <h2><a id="chap10" name="chap10"></a>CLAY</h2>
    <p>
    The matron had given her leave to go out as soon as the women’s tea was
    over and Maria looked forward to her evening out. The kitchen was spick and
    span: the cook said you could see yourself in the big copper boilers. The fire
    was nice and bright and on one of the side-tables were four very big
    barmbracks. These barmbracks seemed uncut; but if you went closer you would see
    that they had been cut into long thick even slices and were ready to be handed
    round at tea. Maria had cut them herself.
    </p>
    <p>
    Maria was a very, very small person indeed but she had a very long nose and a
    very long chin. She talked a little through her nose, always soothingly:
    <i>“Yes, my dear,”</i> and <i>“No, my dear.”</i> She
    was always sent for when the women quarrelled over their tubs and always
    succeeded in making peace. One day the matron had said to her:
    </p>
    <p>
    “Maria, you are a veritable peace-maker!”
    </p>
    <p>
    And the sub-matron and two of the Board ladies had heard the compliment. And
    Ginger Mooney was always saying what she wouldn’t do to the dummy who had
    charge of the irons if it wasn’t for Maria. Everyone was so fond of
    Maria.
    </p>
    <p>
    The women would have their tea at six o’clock and she would be able to
    get away before seven. From Ballsbridge to the Pillar, twenty minutes; from the
    Pillar to Drumcondra, twenty minutes; and twenty minutes to buy the things. She
    would be there before eight. She took out her purse with the silver clasps and
    read again the words <i>A Present from Belfast</i>. She was very fond of that
    purse because Joe had brought it to her five years before when he and Alphy had
    gone to Belfast on a Whit-Monday trip. In the purse were two half-crowns and
    some coppers. She would have five shillings clear after paying tram fare. What
    a nice evening they would have, all the children singing! Only she hoped that
    Joe wouldn’t come in drunk. He was so different when he took any drink.
    </p>
    <p>
    Often he had wanted her to go and live with them; but she would have felt
    herself in the way (though Joe’s wife was ever so nice with her) and she
    had become accustomed to the life of the laundry. Joe was a good fellow. She
    had nursed him and Alphy too; and Joe used often say:
    </p>
    <p>
    “Mamma is mamma but Maria is my proper mother.”
    </p>
    <p>
    After the break-up at home the boys had got her that position in the <i>Dublin
    by Lamplight</i> laundry, and she liked it. She used to have such a bad opinion
    of Protestants but now she thought they were very nice people, a little quiet
    and serious, but still very nice people to live with. Then she had her plants
    in the conservatory and she liked looking after them. She had lovely ferns and
    wax-plants and, whenever anyone came to visit her, she always gave the visitor
    one or two slips from her conservatory. There was one thing she didn’t
    like and that was the tracts on the walks; but the matron was such a nice
    person to deal with, so genteel.
    </p>
    <p>
    When the cook told her everything was ready she went into the women’s
    room and began to pull the big bell. In a few minutes the women began to come
    in by twos and threes, wiping their steaming hands in their petticoats and
    pulling down the sleeves of their blouses over their red steaming arms. They
    settled down before their huge mugs which the cook and the dummy filled up with
    hot tea, already mixed with milk and sugar in huge tin cans. Maria
    superintended the distribution of the barmbrack and saw that every woman got
    her four slices. There was a great deal of laughing and joking during the meal.
    Lizzie Fleming said Maria was sure to get the ring and, though Fleming had said
    that for so many Hallow Eves, Maria had to laugh and say she didn’t want
    any ring or man either; and when she laughed her grey-green eyes sparkled with
    disappointed shyness and the tip of her nose nearly met the tip of her chin.
    Then Ginger Mooney lifted up her mug of tea and proposed Maria’s health
    while all the other women clattered with their mugs on the table, and said she
    was sorry she hadn’t a sup of porter to drink it in. And Maria laughed
    again till the tip of her nose nearly met the tip of her chin and till her
    minute body nearly shook itself asunder because she knew that Mooney meant well
    though, of course, she had the notions of a common woman.
    </p>
    <p>
    But wasn’t Maria glad when the women had finished their tea and the cook
    and the dummy had begun to clear away the tea-things! She went into her little
    bedroom and, remembering that the next morning was a mass morning, changed the
    hand of the alarm from seven to six. Then she took off her working skirt and
    her house-boots and laid her best skirt out on the bed and her tiny dress-boots
    beside the foot of the bed. She changed her blouse too and, as she stood before
    the mirror, she thought of how she used to dress for mass on Sunday morning
    when she was a young girl; and she looked with quaint affection at the
    diminutive body which she had so often adorned. In spite of its years she found
    it a nice tidy little body.
    </p>
    <p>
    When she got outside the streets were shining with rain and she was glad of her
    old brown waterproof. The tram was full and she had to sit on the little stool
    at the end of the car, facing all the people, with her toes barely touching the
    floor. She arranged in her mind all she was going to do and thought how much
    better it was to be independent and to have your own money in your pocket. She
    hoped they would have a nice evening. She was sure they would but she could not
    help thinking what a pity it was Alphy and Joe were not speaking. They were
    always falling out now but when they were boys together they used to be the
    best of friends: but such was life.
    </p>
    <p>
    She got out of her tram at the Pillar and ferreted her way quickly among the
    crowds. She went into Downes’s cake-shop but the shop was so full of
    people that it was a long time before she could get herself attended to. She
    bought a dozen of mixed penny cakes, and at last came out of the shop laden
    with a big bag. Then she thought what else would she buy: she wanted to buy
    something really nice. They would be sure to have plenty of apples and nuts. It
    was hard to know what to buy and all she could think of was cake. She decided
    to buy some plumcake but Downes’s plumcake had not enough almond icing on
    top of it so she went over to a shop in Henry Street. Here she was a long time
    in suiting herself and the stylish young lady behind the counter, who was
    evidently a little annoyed by her, asked her was it wedding-cake she wanted to
    buy. That made Maria blush and smile at the young lady; but the young lady took
    it all very seriously and finally cut a thick slice of plumcake, parcelled it
    up and said:
    </p>
    <p>
    “Two-and-four, please.”
    </p>
    <p>
    She thought she would have to stand in the Drumcondra tram because none of the
    young men seemed to notice her but an elderly gentleman made room for her. He
    was a stout gentleman and he wore a brown hard hat; he had a square red face
    and a greyish moustache. Maria thought he was a colonel-looking gentleman and
    she reflected how much more polite he was than the young men who simply stared
    straight before them. The gentleman began to chat with her about Hallow Eve and
    the rainy weather. He supposed the bag was full of good things for the little
    ones and said it was only right that the youngsters should enjoy themselves
    while they were young. Maria agreed with him and favoured him with demure nods
    and hems. He was very nice with her, and when she was getting out at the Canal
    Bridge she thanked him and bowed, and he bowed to her and raised his hat and
    smiled agreeably, and while she was going up along the terrace, bending her
    tiny head under the rain, she thought how easy it was to know a gentleman even
    when he has a drop taken.
    </p>
    <p>
    Everybody said: <i>“O, here’s Maria!”</i> when she came to
    Joe’s house. Joe was there, having come home from business, and all the
    children had their Sunday dresses on. There were two big girls in from next
    door and games were going on. Maria gave the bag of cakes to the eldest boy,
    Alphy, to divide and Mrs Donnelly said it was too good of her to bring such a
    big bag of cakes and made all the children say:
    </p>
    <p>
    “Thanks, Maria.”
    </p>
    <p>
    But Maria said she had brought something special for papa and mamma, something
    they would be sure to like, and she began to look for her plumcake. She tried
    in Downes’s bag and then in the pockets of her waterproof and then on the
    hallstand but nowhere could she find it. Then she asked all the children had
    any of them eaten it—by mistake, of course—but the children all
    said no and looked as if they did not like to eat cakes if they were to be
    accused of stealing. Everybody had a solution for the mystery and Mrs Donnelly
    said it was plain that Maria had left it behind her in the tram. Maria,
    remembering how confused the gentleman with the greyish moustache had made her,
    coloured with shame and vexation and disappointment. At the thought of the
    failure of her little surprise and of the two and fourpence she had thrown away
    for nothing she nearly cried outright.
    </p>
    <p>
    But Joe said it didn’t matter and made her sit down by the fire. He was
    very nice with her. He told her all that went on in his office, repeating for
    her a smart answer which he had made to the manager. Maria did not understand
    why Joe laughed so much over the answer he had made but she said that the
    manager must have been a very overbearing person to deal with. Joe said he
    wasn’t so bad when you knew how to take him, that he was a decent sort so
    long as you didn’t rub him the wrong way. Mrs Donnelly played the piano
    for the children and they danced and sang. Then the two next-door girls handed
    round the nuts. Nobody could find the nutcrackers and Joe was nearly getting
    cross over it and asked how did they expect Maria to crack nuts without a
    nutcracker. But Maria said she didn’t like nuts and that they
    weren’t to bother about her. Then Joe asked would she take a bottle of
    stout and Mrs Donnelly said there was port wine too in the house if she would
    prefer that. Maria said she would rather they didn’t ask her to take
    anything: but Joe insisted.
    </p>
    <p>
    So Maria let him have his way and they sat by the fire talking over old times
    and Maria thought she would put in a good word for Alphy. But Joe cried that
    God might strike him stone dead if ever he spoke a word to his brother again
    and Maria said she was sorry she had mentioned the matter. Mrs Donnelly told
    her husband it was a great shame for him to speak that way of his own flesh and
    blood but Joe said that Alphy was no brother of his and there was nearly being
    a row on the head of it. But Joe said he would not lose his temper on account
    of the night it was and asked his wife to open some more stout. The two
    next-door girls had arranged some Hallow Eve games and soon everything was
    merry again. Maria was delighted to see the children so merry and Joe and his
    wife in such good spirits. The next-door girls put some saucers on the table
    and then led the children up to the table, blindfold. One got the prayer-book
    and the other three got the water; and when one of the next-door girls got the
    ring Mrs Donnelly shook her finger at the blushing girl as much as to say:
    <i>O, I know all about it!</i> They insisted then on blindfolding Maria and
    leading her up to the table to see what she would get; and, while they were
    putting on the bandage, Maria laughed and laughed again till the tip of her
    nose nearly met the tip of her chin.
    </p>
    <p>
    They led her up to the table amid laughing and joking and she put her hand out
    in the air as she was told to do. She moved her hand about here and there in
    the air and descended on one of the saucers. She felt a soft wet substance with
    her fingers and was surprised that nobody spoke or took off her bandage. There
    was a pause for a few seconds; and then a great deal of scuffling and
    whispering. Somebody said something about the garden, and at last Mrs Donnelly
    said something very cross to one of the next-door girls and told her to throw
    it out at once: that was no play. Maria understood that it was wrong that time
    and so she had to do it over again: and this time she got the prayer-book.
    </p>
    <p>
    After that Mrs Donnelly played Miss McCloud’s Reel for the children and
    Joe made Maria take a glass of wine. Soon they were all quite merry again and
    Mrs Donnelly said Maria would enter a convent before the year was out because
    she had got the prayer-book. Maria had never seen Joe so nice to her as he was
    that night, so full of pleasant talk and reminiscences. She said they were all
    very good to her.
    </p>
    <p>
    At last the children grew tired and sleepy and Joe asked Maria would she not
    sing some little song before she went, one of the old songs. Mrs Donnelly said
    <i>“Do, please, Maria!”</i> and so Maria had to get up and stand
    beside the piano. Mrs Donnelly bade the children be quiet and listen to
    Maria’s song. Then she played the prelude and said <i>“Now,
    Maria!”</i> and Maria, blushing very much began to sing in a tiny
    quavering voice. She sang <i>I Dreamt that I Dwelt</i>, and when she came to
    the second verse she sang again:
    </p>
    <p class="poem">
    <i>I dreamt that I dwelt in marble halls<br/>
        With vassals and serfs at my side<br/>
    And of all who assembled within those walls<br/>
        That I was the hope and the pride.<br/>
    I had riches too great to count, could boast<br/>
        Of a high ancestral name,<br/>
    But I also dreamt, which pleased me most,<br/>
        That you loved me still the same.</i>
    </p>
    <p>
    But no one tried to show her her mistake; and when she had ended her song Joe
    was very much moved. He said that there was no time like the long ago and no
    music for him like poor old Balfe, whatever other people might say; and his
    eyes filled up so much with tears that he could not find what he was looking
    for and in the end he had to ask his wife to tell him where the corkscrew was.
    </p>
    </div><!--end chapter-->
    </body>
    </TEI>




```python
# Update the div element to align with TEI guidelines (Chapter 3.1)
body = soup.find('body')
div = body.find('div')
del div['class']
div['xml:id'] = 'DUB10'
div['n'] = 10
div['type'] = 'chapter'
div
```




    <div n="10" type="chapter" xml:id="DUB10">
    <h2><a id="chap10" name="chap10"></a>CLAY</h2>
    <p>
    The matron had given her leave to go out as soon as the women’s tea was
    over and Maria looked forward to her evening out. The kitchen was spick and
    span: the cook said you could see yourself in the big copper boilers. The fire
    was nice and bright and on one of the side-tables were four very big
    barmbracks. These barmbracks seemed uncut; but if you went closer you would see
    that they had been cut into long thick even slices and were ready to be handed
    round at tea. Maria had cut them herself.
    </p>
    <p>
    Maria was a very, very small person indeed but she had a very long nose and a
    very long chin. She talked a little through her nose, always soothingly:
    <i>“Yes, my dear,”</i> and <i>“No, my dear.”</i> She
    was always sent for when the women quarrelled over their tubs and always
    succeeded in making peace. One day the matron had said to her:
    </p>
    <p>
    “Maria, you are a veritable peace-maker!”
    </p>
    <p>
    And the sub-matron and two of the Board ladies had heard the compliment. And
    Ginger Mooney was always saying what she wouldn’t do to the dummy who had
    charge of the irons if it wasn’t for Maria. Everyone was so fond of
    Maria.
    </p>
    <p>
    The women would have their tea at six o’clock and she would be able to
    get away before seven. From Ballsbridge to the Pillar, twenty minutes; from the
    Pillar to Drumcondra, twenty minutes; and twenty minutes to buy the things. She
    would be there before eight. She took out her purse with the silver clasps and
    read again the words <i>A Present from Belfast</i>. She was very fond of that
    purse because Joe had brought it to her five years before when he and Alphy had
    gone to Belfast on a Whit-Monday trip. In the purse were two half-crowns and
    some coppers. She would have five shillings clear after paying tram fare. What
    a nice evening they would have, all the children singing! Only she hoped that
    Joe wouldn’t come in drunk. He was so different when he took any drink.
    </p>
    <p>
    Often he had wanted her to go and live with them; but she would have felt
    herself in the way (though Joe’s wife was ever so nice with her) and she
    had become accustomed to the life of the laundry. Joe was a good fellow. She
    had nursed him and Alphy too; and Joe used often say:
    </p>
    <p>
    “Mamma is mamma but Maria is my proper mother.”
    </p>
    <p>
    After the break-up at home the boys had got her that position in the <i>Dublin
    by Lamplight</i> laundry, and she liked it. She used to have such a bad opinion
    of Protestants but now she thought they were very nice people, a little quiet
    and serious, but still very nice people to live with. Then she had her plants
    in the conservatory and she liked looking after them. She had lovely ferns and
    wax-plants and, whenever anyone came to visit her, she always gave the visitor
    one or two slips from her conservatory. There was one thing she didn’t
    like and that was the tracts on the walks; but the matron was such a nice
    person to deal with, so genteel.
    </p>
    <p>
    When the cook told her everything was ready she went into the women’s
    room and began to pull the big bell. In a few minutes the women began to come
    in by twos and threes, wiping their steaming hands in their petticoats and
    pulling down the sleeves of their blouses over their red steaming arms. They
    settled down before their huge mugs which the cook and the dummy filled up with
    hot tea, already mixed with milk and sugar in huge tin cans. Maria
    superintended the distribution of the barmbrack and saw that every woman got
    her four slices. There was a great deal of laughing and joking during the meal.
    Lizzie Fleming said Maria was sure to get the ring and, though Fleming had said
    that for so many Hallow Eves, Maria had to laugh and say she didn’t want
    any ring or man either; and when she laughed her grey-green eyes sparkled with
    disappointed shyness and the tip of her nose nearly met the tip of her chin.
    Then Ginger Mooney lifted up her mug of tea and proposed Maria’s health
    while all the other women clattered with their mugs on the table, and said she
    was sorry she hadn’t a sup of porter to drink it in. And Maria laughed
    again till the tip of her nose nearly met the tip of her chin and till her
    minute body nearly shook itself asunder because she knew that Mooney meant well
    though, of course, she had the notions of a common woman.
    </p>
    <p>
    But wasn’t Maria glad when the women had finished their tea and the cook
    and the dummy had begun to clear away the tea-things! She went into her little
    bedroom and, remembering that the next morning was a mass morning, changed the
    hand of the alarm from seven to six. Then she took off her working skirt and
    her house-boots and laid her best skirt out on the bed and her tiny dress-boots
    beside the foot of the bed. She changed her blouse too and, as she stood before
    the mirror, she thought of how she used to dress for mass on Sunday morning
    when she was a young girl; and she looked with quaint affection at the
    diminutive body which she had so often adorned. In spite of its years she found
    it a nice tidy little body.
    </p>
    <p>
    When she got outside the streets were shining with rain and she was glad of her
    old brown waterproof. The tram was full and she had to sit on the little stool
    at the end of the car, facing all the people, with her toes barely touching the
    floor. She arranged in her mind all she was going to do and thought how much
    better it was to be independent and to have your own money in your pocket. She
    hoped they would have a nice evening. She was sure they would but she could not
    help thinking what a pity it was Alphy and Joe were not speaking. They were
    always falling out now but when they were boys together they used to be the
    best of friends: but such was life.
    </p>
    <p>
    She got out of her tram at the Pillar and ferreted her way quickly among the
    crowds. She went into Downes’s cake-shop but the shop was so full of
    people that it was a long time before she could get herself attended to. She
    bought a dozen of mixed penny cakes, and at last came out of the shop laden
    with a big bag. Then she thought what else would she buy: she wanted to buy
    something really nice. They would be sure to have plenty of apples and nuts. It
    was hard to know what to buy and all she could think of was cake. She decided
    to buy some plumcake but Downes’s plumcake had not enough almond icing on
    top of it so she went over to a shop in Henry Street. Here she was a long time
    in suiting herself and the stylish young lady behind the counter, who was
    evidently a little annoyed by her, asked her was it wedding-cake she wanted to
    buy. That made Maria blush and smile at the young lady; but the young lady took
    it all very seriously and finally cut a thick slice of plumcake, parcelled it
    up and said:
    </p>
    <p>
    “Two-and-four, please.”
    </p>
    <p>
    She thought she would have to stand in the Drumcondra tram because none of the
    young men seemed to notice her but an elderly gentleman made room for her. He
    was a stout gentleman and he wore a brown hard hat; he had a square red face
    and a greyish moustache. Maria thought he was a colonel-looking gentleman and
    she reflected how much more polite he was than the young men who simply stared
    straight before them. The gentleman began to chat with her about Hallow Eve and
    the rainy weather. He supposed the bag was full of good things for the little
    ones and said it was only right that the youngsters should enjoy themselves
    while they were young. Maria agreed with him and favoured him with demure nods
    and hems. He was very nice with her, and when she was getting out at the Canal
    Bridge she thanked him and bowed, and he bowed to her and raised his hat and
    smiled agreeably, and while she was going up along the terrace, bending her
    tiny head under the rain, she thought how easy it was to know a gentleman even
    when he has a drop taken.
    </p>
    <p>
    Everybody said: <i>“O, here’s Maria!”</i> when she came to
    Joe’s house. Joe was there, having come home from business, and all the
    children had their Sunday dresses on. There were two big girls in from next
    door and games were going on. Maria gave the bag of cakes to the eldest boy,
    Alphy, to divide and Mrs Donnelly said it was too good of her to bring such a
    big bag of cakes and made all the children say:
    </p>
    <p>
    “Thanks, Maria.”
    </p>
    <p>
    But Maria said she had brought something special for papa and mamma, something
    they would be sure to like, and she began to look for her plumcake. She tried
    in Downes’s bag and then in the pockets of her waterproof and then on the
    hallstand but nowhere could she find it. Then she asked all the children had
    any of them eaten it—by mistake, of course—but the children all
    said no and looked as if they did not like to eat cakes if they were to be
    accused of stealing. Everybody had a solution for the mystery and Mrs Donnelly
    said it was plain that Maria had left it behind her in the tram. Maria,
    remembering how confused the gentleman with the greyish moustache had made her,
    coloured with shame and vexation and disappointment. At the thought of the
    failure of her little surprise and of the two and fourpence she had thrown away
    for nothing she nearly cried outright.
    </p>
    <p>
    But Joe said it didn’t matter and made her sit down by the fire. He was
    very nice with her. He told her all that went on in his office, repeating for
    her a smart answer which he had made to the manager. Maria did not understand
    why Joe laughed so much over the answer he had made but she said that the
    manager must have been a very overbearing person to deal with. Joe said he
    wasn’t so bad when you knew how to take him, that he was a decent sort so
    long as you didn’t rub him the wrong way. Mrs Donnelly played the piano
    for the children and they danced and sang. Then the two next-door girls handed
    round the nuts. Nobody could find the nutcrackers and Joe was nearly getting
    cross over it and asked how did they expect Maria to crack nuts without a
    nutcracker. But Maria said she didn’t like nuts and that they
    weren’t to bother about her. Then Joe asked would she take a bottle of
    stout and Mrs Donnelly said there was port wine too in the house if she would
    prefer that. Maria said she would rather they didn’t ask her to take
    anything: but Joe insisted.
    </p>
    <p>
    So Maria let him have his way and they sat by the fire talking over old times
    and Maria thought she would put in a good word for Alphy. But Joe cried that
    God might strike him stone dead if ever he spoke a word to his brother again
    and Maria said she was sorry she had mentioned the matter. Mrs Donnelly told
    her husband it was a great shame for him to speak that way of his own flesh and
    blood but Joe said that Alphy was no brother of his and there was nearly being
    a row on the head of it. But Joe said he would not lose his temper on account
    of the night it was and asked his wife to open some more stout. The two
    next-door girls had arranged some Hallow Eve games and soon everything was
    merry again. Maria was delighted to see the children so merry and Joe and his
    wife in such good spirits. The next-door girls put some saucers on the table
    and then led the children up to the table, blindfold. One got the prayer-book
    and the other three got the water; and when one of the next-door girls got the
    ring Mrs Donnelly shook her finger at the blushing girl as much as to say:
    <i>O, I know all about it!</i> They insisted then on blindfolding Maria and
    leading her up to the table to see what she would get; and, while they were
    putting on the bandage, Maria laughed and laughed again till the tip of her
    nose nearly met the tip of her chin.
    </p>
    <p>
    They led her up to the table amid laughing and joking and she put her hand out
    in the air as she was told to do. She moved her hand about here and there in
    the air and descended on one of the saucers. She felt a soft wet substance with
    her fingers and was surprised that nobody spoke or took off her bandage. There
    was a pause for a few seconds; and then a great deal of scuffling and
    whispering. Somebody said something about the garden, and at last Mrs Donnelly
    said something very cross to one of the next-door girls and told her to throw
    it out at once: that was no play. Maria understood that it was wrong that time
    and so she had to do it over again: and this time she got the prayer-book.
    </p>
    <p>
    After that Mrs Donnelly played Miss McCloud’s Reel for the children and
    Joe made Maria take a glass of wine. Soon they were all quite merry again and
    Mrs Donnelly said Maria would enter a convent before the year was out because
    she had got the prayer-book. Maria had never seen Joe so nice to her as he was
    that night, so full of pleasant talk and reminiscences. She said they were all
    very good to her.
    </p>
    <p>
    At last the children grew tired and sleepy and Joe asked Maria would she not
    sing some little song before she went, one of the old songs. Mrs Donnelly said
    <i>“Do, please, Maria!”</i> and so Maria had to get up and stand
    beside the piano. Mrs Donnelly bade the children be quiet and listen to
    Maria’s song. Then she played the prelude and said <i>“Now,
    Maria!”</i> and Maria, blushing very much began to sing in a tiny
    quavering voice. She sang <i>I Dreamt that I Dwelt</i>, and when she came to
    the second verse she sang again:
    </p>
    <p class="poem">
    <i>I dreamt that I dwelt in marble halls<br/>
        With vassals and serfs at my side<br/>
    And of all who assembled within those walls<br/>
        That I was the hope and the pride.<br/>
    I had riches too great to count, could boast<br/>
        Of a high ancestral name,<br/>
    But I also dreamt, which pleased me most,<br/>
        That you loved me still the same.</i>
    </p>
    <p>
    But no one tried to show her her mistake; and when she had ended her song Joe
    was very much moved. He said that there was no time like the long ago and no
    music for him like poor old Balfe, whatever other people might say; and his
    eyes filled up so much with tears that he could not find what he was looking
    for and in the end he had to ask his wife to tell him where the corkscrew was.
    </p>
    </div>




```python
# Update the header of the chapter to align with TEI guidelines (Chapter 3.2)
head = div.find('h2')
head.name = 'head'
a = head.find('a')
a.extract()
div
```




    <div n="10" type="chapter" xml:id="DUB10">
    <head>CLAY</head>
    <p>
    The matron had given her leave to go out as soon as the women’s tea was
    over and Maria looked forward to her evening out. The kitchen was spick and
    span: the cook said you could see yourself in the big copper boilers. The fire
    was nice and bright and on one of the side-tables were four very big
    barmbracks. These barmbracks seemed uncut; but if you went closer you would see
    that they had been cut into long thick even slices and were ready to be handed
    round at tea. Maria had cut them herself.
    </p>
    <p>
    Maria was a very, very small person indeed but she had a very long nose and a
    very long chin. She talked a little through her nose, always soothingly:
    <i>“Yes, my dear,”</i> and <i>“No, my dear.”</i> She
    was always sent for when the women quarrelled over their tubs and always
    succeeded in making peace. One day the matron had said to her:
    </p>
    <p>
    “Maria, you are a veritable peace-maker!”
    </p>
    <p>
    And the sub-matron and two of the Board ladies had heard the compliment. And
    Ginger Mooney was always saying what she wouldn’t do to the dummy who had
    charge of the irons if it wasn’t for Maria. Everyone was so fond of
    Maria.
    </p>
    <p>
    The women would have their tea at six o’clock and she would be able to
    get away before seven. From Ballsbridge to the Pillar, twenty minutes; from the
    Pillar to Drumcondra, twenty minutes; and twenty minutes to buy the things. She
    would be there before eight. She took out her purse with the silver clasps and
    read again the words <i>A Present from Belfast</i>. She was very fond of that
    purse because Joe had brought it to her five years before when he and Alphy had
    gone to Belfast on a Whit-Monday trip. In the purse were two half-crowns and
    some coppers. She would have five shillings clear after paying tram fare. What
    a nice evening they would have, all the children singing! Only she hoped that
    Joe wouldn’t come in drunk. He was so different when he took any drink.
    </p>
    <p>
    Often he had wanted her to go and live with them; but she would have felt
    herself in the way (though Joe’s wife was ever so nice with her) and she
    had become accustomed to the life of the laundry. Joe was a good fellow. She
    had nursed him and Alphy too; and Joe used often say:
    </p>
    <p>
    “Mamma is mamma but Maria is my proper mother.”
    </p>
    <p>
    After the break-up at home the boys had got her that position in the <i>Dublin
    by Lamplight</i> laundry, and she liked it. She used to have such a bad opinion
    of Protestants but now she thought they were very nice people, a little quiet
    and serious, but still very nice people to live with. Then she had her plants
    in the conservatory and she liked looking after them. She had lovely ferns and
    wax-plants and, whenever anyone came to visit her, she always gave the visitor
    one or two slips from her conservatory. There was one thing she didn’t
    like and that was the tracts on the walks; but the matron was such a nice
    person to deal with, so genteel.
    </p>
    <p>
    When the cook told her everything was ready she went into the women’s
    room and began to pull the big bell. In a few minutes the women began to come
    in by twos and threes, wiping their steaming hands in their petticoats and
    pulling down the sleeves of their blouses over their red steaming arms. They
    settled down before their huge mugs which the cook and the dummy filled up with
    hot tea, already mixed with milk and sugar in huge tin cans. Maria
    superintended the distribution of the barmbrack and saw that every woman got
    her four slices. There was a great deal of laughing and joking during the meal.
    Lizzie Fleming said Maria was sure to get the ring and, though Fleming had said
    that for so many Hallow Eves, Maria had to laugh and say she didn’t want
    any ring or man either; and when she laughed her grey-green eyes sparkled with
    disappointed shyness and the tip of her nose nearly met the tip of her chin.
    Then Ginger Mooney lifted up her mug of tea and proposed Maria’s health
    while all the other women clattered with their mugs on the table, and said she
    was sorry she hadn’t a sup of porter to drink it in. And Maria laughed
    again till the tip of her nose nearly met the tip of her chin and till her
    minute body nearly shook itself asunder because she knew that Mooney meant well
    though, of course, she had the notions of a common woman.
    </p>
    <p>
    But wasn’t Maria glad when the women had finished their tea and the cook
    and the dummy had begun to clear away the tea-things! She went into her little
    bedroom and, remembering that the next morning was a mass morning, changed the
    hand of the alarm from seven to six. Then she took off her working skirt and
    her house-boots and laid her best skirt out on the bed and her tiny dress-boots
    beside the foot of the bed. She changed her blouse too and, as she stood before
    the mirror, she thought of how she used to dress for mass on Sunday morning
    when she was a young girl; and she looked with quaint affection at the
    diminutive body which she had so often adorned. In spite of its years she found
    it a nice tidy little body.
    </p>
    <p>
    When she got outside the streets were shining with rain and she was glad of her
    old brown waterproof. The tram was full and she had to sit on the little stool
    at the end of the car, facing all the people, with her toes barely touching the
    floor. She arranged in her mind all she was going to do and thought how much
    better it was to be independent and to have your own money in your pocket. She
    hoped they would have a nice evening. She was sure they would but she could not
    help thinking what a pity it was Alphy and Joe were not speaking. They were
    always falling out now but when they were boys together they used to be the
    best of friends: but such was life.
    </p>
    <p>
    She got out of her tram at the Pillar and ferreted her way quickly among the
    crowds. She went into Downes’s cake-shop but the shop was so full of
    people that it was a long time before she could get herself attended to. She
    bought a dozen of mixed penny cakes, and at last came out of the shop laden
    with a big bag. Then she thought what else would she buy: she wanted to buy
    something really nice. They would be sure to have plenty of apples and nuts. It
    was hard to know what to buy and all she could think of was cake. She decided
    to buy some plumcake but Downes’s plumcake had not enough almond icing on
    top of it so she went over to a shop in Henry Street. Here she was a long time
    in suiting herself and the stylish young lady behind the counter, who was
    evidently a little annoyed by her, asked her was it wedding-cake she wanted to
    buy. That made Maria blush and smile at the young lady; but the young lady took
    it all very seriously and finally cut a thick slice of plumcake, parcelled it
    up and said:
    </p>
    <p>
    “Two-and-four, please.”
    </p>
    <p>
    She thought she would have to stand in the Drumcondra tram because none of the
    young men seemed to notice her but an elderly gentleman made room for her. He
    was a stout gentleman and he wore a brown hard hat; he had a square red face
    and a greyish moustache. Maria thought he was a colonel-looking gentleman and
    she reflected how much more polite he was than the young men who simply stared
    straight before them. The gentleman began to chat with her about Hallow Eve and
    the rainy weather. He supposed the bag was full of good things for the little
    ones and said it was only right that the youngsters should enjoy themselves
    while they were young. Maria agreed with him and favoured him with demure nods
    and hems. He was very nice with her, and when she was getting out at the Canal
    Bridge she thanked him and bowed, and he bowed to her and raised his hat and
    smiled agreeably, and while she was going up along the terrace, bending her
    tiny head under the rain, she thought how easy it was to know a gentleman even
    when he has a drop taken.
    </p>
    <p>
    Everybody said: <i>“O, here’s Maria!”</i> when she came to
    Joe’s house. Joe was there, having come home from business, and all the
    children had their Sunday dresses on. There were two big girls in from next
    door and games were going on. Maria gave the bag of cakes to the eldest boy,
    Alphy, to divide and Mrs Donnelly said it was too good of her to bring such a
    big bag of cakes and made all the children say:
    </p>
    <p>
    “Thanks, Maria.”
    </p>
    <p>
    But Maria said she had brought something special for papa and mamma, something
    they would be sure to like, and she began to look for her plumcake. She tried
    in Downes’s bag and then in the pockets of her waterproof and then on the
    hallstand but nowhere could she find it. Then she asked all the children had
    any of them eaten it—by mistake, of course—but the children all
    said no and looked as if they did not like to eat cakes if they were to be
    accused of stealing. Everybody had a solution for the mystery and Mrs Donnelly
    said it was plain that Maria had left it behind her in the tram. Maria,
    remembering how confused the gentleman with the greyish moustache had made her,
    coloured with shame and vexation and disappointment. At the thought of the
    failure of her little surprise and of the two and fourpence she had thrown away
    for nothing she nearly cried outright.
    </p>
    <p>
    But Joe said it didn’t matter and made her sit down by the fire. He was
    very nice with her. He told her all that went on in his office, repeating for
    her a smart answer which he had made to the manager. Maria did not understand
    why Joe laughed so much over the answer he had made but she said that the
    manager must have been a very overbearing person to deal with. Joe said he
    wasn’t so bad when you knew how to take him, that he was a decent sort so
    long as you didn’t rub him the wrong way. Mrs Donnelly played the piano
    for the children and they danced and sang. Then the two next-door girls handed
    round the nuts. Nobody could find the nutcrackers and Joe was nearly getting
    cross over it and asked how did they expect Maria to crack nuts without a
    nutcracker. But Maria said she didn’t like nuts and that they
    weren’t to bother about her. Then Joe asked would she take a bottle of
    stout and Mrs Donnelly said there was port wine too in the house if she would
    prefer that. Maria said she would rather they didn’t ask her to take
    anything: but Joe insisted.
    </p>
    <p>
    So Maria let him have his way and they sat by the fire talking over old times
    and Maria thought she would put in a good word for Alphy. But Joe cried that
    God might strike him stone dead if ever he spoke a word to his brother again
    and Maria said she was sorry she had mentioned the matter. Mrs Donnelly told
    her husband it was a great shame for him to speak that way of his own flesh and
    blood but Joe said that Alphy was no brother of his and there was nearly being
    a row on the head of it. But Joe said he would not lose his temper on account
    of the night it was and asked his wife to open some more stout. The two
    next-door girls had arranged some Hallow Eve games and soon everything was
    merry again. Maria was delighted to see the children so merry and Joe and his
    wife in such good spirits. The next-door girls put some saucers on the table
    and then led the children up to the table, blindfold. One got the prayer-book
    and the other three got the water; and when one of the next-door girls got the
    ring Mrs Donnelly shook her finger at the blushing girl as much as to say:
    <i>O, I know all about it!</i> They insisted then on blindfolding Maria and
    leading her up to the table to see what she would get; and, while they were
    putting on the bandage, Maria laughed and laughed again till the tip of her
    nose nearly met the tip of her chin.
    </p>
    <p>
    They led her up to the table amid laughing and joking and she put her hand out
    in the air as she was told to do. She moved her hand about here and there in
    the air and descended on one of the saucers. She felt a soft wet substance with
    her fingers and was surprised that nobody spoke or took off her bandage. There
    was a pause for a few seconds; and then a great deal of scuffling and
    whispering. Somebody said something about the garden, and at last Mrs Donnelly
    said something very cross to one of the next-door girls and told her to throw
    it out at once: that was no play. Maria understood that it was wrong that time
    and so she had to do it over again: and this time she got the prayer-book.
    </p>
    <p>
    After that Mrs Donnelly played Miss McCloud’s Reel for the children and
    Joe made Maria take a glass of wine. Soon they were all quite merry again and
    Mrs Donnelly said Maria would enter a convent before the year was out because
    she had got the prayer-book. Maria had never seen Joe so nice to her as he was
    that night, so full of pleasant talk and reminiscences. She said they were all
    very good to her.
    </p>
    <p>
    At last the children grew tired and sleepy and Joe asked Maria would she not
    sing some little song before she went, one of the old songs. Mrs Donnelly said
    <i>“Do, please, Maria!”</i> and so Maria had to get up and stand
    beside the piano. Mrs Donnelly bade the children be quiet and listen to
    Maria’s song. Then she played the prelude and said <i>“Now,
    Maria!”</i> and Maria, blushing very much began to sing in a tiny
    quavering voice. She sang <i>I Dreamt that I Dwelt</i>, and when she came to
    the second verse she sang again:
    </p>
    <p class="poem">
    <i>I dreamt that I dwelt in marble halls<br/>
        With vassals and serfs at my side<br/>
    And of all who assembled within those walls<br/>
        That I was the hope and the pride.<br/>
    I had riches too great to count, could boast<br/>
        Of a high ancestral name,<br/>
    But I also dreamt, which pleased me most,<br/>
        That you loved me still the same.</i>
    </p>
    <p>
    But no one tried to show her her mistake; and when she had ended her song Joe
    was very much moved. He said that there was no time like the long ago and no
    music for him like poor old Balfe, whatever other people might say; and his
    eyes filled up so much with tears that he could not find what he was looking
    for and in the end he had to ask his wife to tell him where the corkscrew was.
    </p>
    </div>




```python
# Update the poem paragraph to align with TEI guidelines (Chapter 3.3.1)
poem_paragraph = div.find('p', 'poem') # find the poem paragraph
del poem_paragraph['class']
poem_paragraph.name = 'lg'
poem_paragraph['rhyme'] = 'ABAB'
poem_text = poem_paragraph.find('i')
poem_text.unwrap() # Move the contents of <i> directly under <lg>
poem_paragraph
```




    <lg rhyme="ABAB">
    I dreamt that I dwelt in marble halls<br/>
        With vassals and serfs at my side<br/>
    And of all who assembled within those walls<br/>
        That I was the hope and the pride.<br/>
    I had riches too great to count, could boast<br/>
        Of a high ancestral name,<br/>
    But I also dreamt, which pleased me most,<br/>
        That you loved me still the same.
    </lg>




```python
# Split by lines and get the context
poem_text = poem_paragraph.stripped_strings
for line in poem_text:
    print(line)
```

    I dreamt that I dwelt in marble halls
    With vassals and serfs at my side
    And of all who assembled within those walls
    That I was the hope and the pride.
    I had riches too great to count, could boast
    Of a high ancestral name,
    But I also dreamt, which pleased me most,
    That you loved me still the same.
    


```python
# Update each line of the poem paragraph and replace the original poem_paragraph with new_poem_paragraph
poem_text = poem_paragraph.stripped_strings
new_poem_paragraph = soup.new_tag('lg', rhyme=poem_paragraph['rhyme']) # create a new_poem_paragraph

count = 0 # this is used to calculate odds and even lines (for rhyme patterns)
for line in poem_text:
    new_tag = soup.new_tag('l') # create a new <l> tag
    new_tag.string = ' '.join(line.split()[:-1]) + ' ' # set the new tag to be the line without the rhyme word
    if count %2 == 0: # if 1,3,5,7 lines
        rhyme_tag = soup.new_tag('rhyme', label='A') # rhyme label is "A"
        if line.split()[-1][-1].isalpha(): # if last character of the last element after splitting is a character
            rhyme_tag.string = line.split()[-1] # the last element after splitting is the rhyme word
            new_tag.append(rhyme_tag)
        else: # if last character of the last element after splitting is a punctuation
            rhyme_tag.string = line.split()[-1][:-1] # the last element without the last character is the rhyme word
            new_tag.append(rhyme_tag)
            new_tag.append(line.split()[-1][-1]) # add the punctuation after the rhyme word ends
    else: # if 2,4,6,8 lines
        rhyme_tag = soup.new_tag('rhyme', label='B') # rhyme label is "B"
        if line.split()[-1][-1].isalpha(): # if last character of the last element after splitting is a character
            rhyme_tag.string = line.split()[-1] # the last element after splitting is the rhyme word
            new_tag.append(rhyme_tag)
        else: # if last character of the last element after splitting is a punctuation
            rhyme_tag.string = line.split()[-1][:-1] # the last element without the last character is the rhyme word
            new_tag.append(rhyme_tag)
            new_tag.append(line.split()[-1][-1]) # add the punctuation after the rhyme word ends
    new_poem_paragraph.append(new_tag)
    count += 1
new_poem_paragraph
```




    <lg rhyme="ABAB"><l>I dreamt that I dwelt in marble <rhyme label="A">halls</rhyme></l><l>With vassals and serfs at my <rhyme label="B">side</rhyme></l><l>And of all who assembled within those <rhyme label="A">walls</rhyme></l><l>That I was the hope and the <rhyme label="B">pride</rhyme>.</l><l>I had riches too great to count, could <rhyme label="A">boast</rhyme></l><l>Of a high ancestral <rhyme label="B">name</rhyme>,</l><l>But I also dreamt, which pleased me <rhyme label="A">most</rhyme>,</l><l>That you loved me still the <rhyme label="B">same</rhyme>.</l></lg>




```python
# Replace the poem paragraph with the newly created paragraph
poem_paragraph.replace_with(new_poem_paragraph)
div
```




    <div n="10" type="chapter" xml:id="DUB10">
    <head>CLAY</head>
    <p>
    The matron had given her leave to go out as soon as the women’s tea was
    over and Maria looked forward to her evening out. The kitchen was spick and
    span: the cook said you could see yourself in the big copper boilers. The fire
    was nice and bright and on one of the side-tables were four very big
    barmbracks. These barmbracks seemed uncut; but if you went closer you would see
    that they had been cut into long thick even slices and were ready to be handed
    round at tea. Maria had cut them herself.
    </p>
    <p>
    Maria was a very, very small person indeed but she had a very long nose and a
    very long chin. She talked a little through her nose, always soothingly:
    <i>“Yes, my dear,”</i> and <i>“No, my dear.”</i> She
    was always sent for when the women quarrelled over their tubs and always
    succeeded in making peace. One day the matron had said to her:
    </p>
    <p>
    “Maria, you are a veritable peace-maker!”
    </p>
    <p>
    And the sub-matron and two of the Board ladies had heard the compliment. And
    Ginger Mooney was always saying what she wouldn’t do to the dummy who had
    charge of the irons if it wasn’t for Maria. Everyone was so fond of
    Maria.
    </p>
    <p>
    The women would have their tea at six o’clock and she would be able to
    get away before seven. From Ballsbridge to the Pillar, twenty minutes; from the
    Pillar to Drumcondra, twenty minutes; and twenty minutes to buy the things. She
    would be there before eight. She took out her purse with the silver clasps and
    read again the words <i>A Present from Belfast</i>. She was very fond of that
    purse because Joe had brought it to her five years before when he and Alphy had
    gone to Belfast on a Whit-Monday trip. In the purse were two half-crowns and
    some coppers. She would have five shillings clear after paying tram fare. What
    a nice evening they would have, all the children singing! Only she hoped that
    Joe wouldn’t come in drunk. He was so different when he took any drink.
    </p>
    <p>
    Often he had wanted her to go and live with them; but she would have felt
    herself in the way (though Joe’s wife was ever so nice with her) and she
    had become accustomed to the life of the laundry. Joe was a good fellow. She
    had nursed him and Alphy too; and Joe used often say:
    </p>
    <p>
    “Mamma is mamma but Maria is my proper mother.”
    </p>
    <p>
    After the break-up at home the boys had got her that position in the <i>Dublin
    by Lamplight</i> laundry, and she liked it. She used to have such a bad opinion
    of Protestants but now she thought they were very nice people, a little quiet
    and serious, but still very nice people to live with. Then she had her plants
    in the conservatory and she liked looking after them. She had lovely ferns and
    wax-plants and, whenever anyone came to visit her, she always gave the visitor
    one or two slips from her conservatory. There was one thing she didn’t
    like and that was the tracts on the walks; but the matron was such a nice
    person to deal with, so genteel.
    </p>
    <p>
    When the cook told her everything was ready she went into the women’s
    room and began to pull the big bell. In a few minutes the women began to come
    in by twos and threes, wiping their steaming hands in their petticoats and
    pulling down the sleeves of their blouses over their red steaming arms. They
    settled down before their huge mugs which the cook and the dummy filled up with
    hot tea, already mixed with milk and sugar in huge tin cans. Maria
    superintended the distribution of the barmbrack and saw that every woman got
    her four slices. There was a great deal of laughing and joking during the meal.
    Lizzie Fleming said Maria was sure to get the ring and, though Fleming had said
    that for so many Hallow Eves, Maria had to laugh and say she didn’t want
    any ring or man either; and when she laughed her grey-green eyes sparkled with
    disappointed shyness and the tip of her nose nearly met the tip of her chin.
    Then Ginger Mooney lifted up her mug of tea and proposed Maria’s health
    while all the other women clattered with their mugs on the table, and said she
    was sorry she hadn’t a sup of porter to drink it in. And Maria laughed
    again till the tip of her nose nearly met the tip of her chin and till her
    minute body nearly shook itself asunder because she knew that Mooney meant well
    though, of course, she had the notions of a common woman.
    </p>
    <p>
    But wasn’t Maria glad when the women had finished their tea and the cook
    and the dummy had begun to clear away the tea-things! She went into her little
    bedroom and, remembering that the next morning was a mass morning, changed the
    hand of the alarm from seven to six. Then she took off her working skirt and
    her house-boots and laid her best skirt out on the bed and her tiny dress-boots
    beside the foot of the bed. She changed her blouse too and, as she stood before
    the mirror, she thought of how she used to dress for mass on Sunday morning
    when she was a young girl; and she looked with quaint affection at the
    diminutive body which she had so often adorned. In spite of its years she found
    it a nice tidy little body.
    </p>
    <p>
    When she got outside the streets were shining with rain and she was glad of her
    old brown waterproof. The tram was full and she had to sit on the little stool
    at the end of the car, facing all the people, with her toes barely touching the
    floor. She arranged in her mind all she was going to do and thought how much
    better it was to be independent and to have your own money in your pocket. She
    hoped they would have a nice evening. She was sure they would but she could not
    help thinking what a pity it was Alphy and Joe were not speaking. They were
    always falling out now but when they were boys together they used to be the
    best of friends: but such was life.
    </p>
    <p>
    She got out of her tram at the Pillar and ferreted her way quickly among the
    crowds. She went into Downes’s cake-shop but the shop was so full of
    people that it was a long time before she could get herself attended to. She
    bought a dozen of mixed penny cakes, and at last came out of the shop laden
    with a big bag. Then she thought what else would she buy: she wanted to buy
    something really nice. They would be sure to have plenty of apples and nuts. It
    was hard to know what to buy and all she could think of was cake. She decided
    to buy some plumcake but Downes’s plumcake had not enough almond icing on
    top of it so she went over to a shop in Henry Street. Here she was a long time
    in suiting herself and the stylish young lady behind the counter, who was
    evidently a little annoyed by her, asked her was it wedding-cake she wanted to
    buy. That made Maria blush and smile at the young lady; but the young lady took
    it all very seriously and finally cut a thick slice of plumcake, parcelled it
    up and said:
    </p>
    <p>
    “Two-and-four, please.”
    </p>
    <p>
    She thought she would have to stand in the Drumcondra tram because none of the
    young men seemed to notice her but an elderly gentleman made room for her. He
    was a stout gentleman and he wore a brown hard hat; he had a square red face
    and a greyish moustache. Maria thought he was a colonel-looking gentleman and
    she reflected how much more polite he was than the young men who simply stared
    straight before them. The gentleman began to chat with her about Hallow Eve and
    the rainy weather. He supposed the bag was full of good things for the little
    ones and said it was only right that the youngsters should enjoy themselves
    while they were young. Maria agreed with him and favoured him with demure nods
    and hems. He was very nice with her, and when she was getting out at the Canal
    Bridge she thanked him and bowed, and he bowed to her and raised his hat and
    smiled agreeably, and while she was going up along the terrace, bending her
    tiny head under the rain, she thought how easy it was to know a gentleman even
    when he has a drop taken.
    </p>
    <p>
    Everybody said: <i>“O, here’s Maria!”</i> when she came to
    Joe’s house. Joe was there, having come home from business, and all the
    children had their Sunday dresses on. There were two big girls in from next
    door and games were going on. Maria gave the bag of cakes to the eldest boy,
    Alphy, to divide and Mrs Donnelly said it was too good of her to bring such a
    big bag of cakes and made all the children say:
    </p>
    <p>
    “Thanks, Maria.”
    </p>
    <p>
    But Maria said she had brought something special for papa and mamma, something
    they would be sure to like, and she began to look for her plumcake. She tried
    in Downes’s bag and then in the pockets of her waterproof and then on the
    hallstand but nowhere could she find it. Then she asked all the children had
    any of them eaten it—by mistake, of course—but the children all
    said no and looked as if they did not like to eat cakes if they were to be
    accused of stealing. Everybody had a solution for the mystery and Mrs Donnelly
    said it was plain that Maria had left it behind her in the tram. Maria,
    remembering how confused the gentleman with the greyish moustache had made her,
    coloured with shame and vexation and disappointment. At the thought of the
    failure of her little surprise and of the two and fourpence she had thrown away
    for nothing she nearly cried outright.
    </p>
    <p>
    But Joe said it didn’t matter and made her sit down by the fire. He was
    very nice with her. He told her all that went on in his office, repeating for
    her a smart answer which he had made to the manager. Maria did not understand
    why Joe laughed so much over the answer he had made but she said that the
    manager must have been a very overbearing person to deal with. Joe said he
    wasn’t so bad when you knew how to take him, that he was a decent sort so
    long as you didn’t rub him the wrong way. Mrs Donnelly played the piano
    for the children and they danced and sang. Then the two next-door girls handed
    round the nuts. Nobody could find the nutcrackers and Joe was nearly getting
    cross over it and asked how did they expect Maria to crack nuts without a
    nutcracker. But Maria said she didn’t like nuts and that they
    weren’t to bother about her. Then Joe asked would she take a bottle of
    stout and Mrs Donnelly said there was port wine too in the house if she would
    prefer that. Maria said she would rather they didn’t ask her to take
    anything: but Joe insisted.
    </p>
    <p>
    So Maria let him have his way and they sat by the fire talking over old times
    and Maria thought she would put in a good word for Alphy. But Joe cried that
    God might strike him stone dead if ever he spoke a word to his brother again
    and Maria said she was sorry she had mentioned the matter. Mrs Donnelly told
    her husband it was a great shame for him to speak that way of his own flesh and
    blood but Joe said that Alphy was no brother of his and there was nearly being
    a row on the head of it. But Joe said he would not lose his temper on account
    of the night it was and asked his wife to open some more stout. The two
    next-door girls had arranged some Hallow Eve games and soon everything was
    merry again. Maria was delighted to see the children so merry and Joe and his
    wife in such good spirits. The next-door girls put some saucers on the table
    and then led the children up to the table, blindfold. One got the prayer-book
    and the other three got the water; and when one of the next-door girls got the
    ring Mrs Donnelly shook her finger at the blushing girl as much as to say:
    <i>O, I know all about it!</i> They insisted then on blindfolding Maria and
    leading her up to the table to see what she would get; and, while they were
    putting on the bandage, Maria laughed and laughed again till the tip of her
    nose nearly met the tip of her chin.
    </p>
    <p>
    They led her up to the table amid laughing and joking and she put her hand out
    in the air as she was told to do. She moved her hand about here and there in
    the air and descended on one of the saucers. She felt a soft wet substance with
    her fingers and was surprised that nobody spoke or took off her bandage. There
    was a pause for a few seconds; and then a great deal of scuffling and
    whispering. Somebody said something about the garden, and at last Mrs Donnelly
    said something very cross to one of the next-door girls and told her to throw
    it out at once: that was no play. Maria understood that it was wrong that time
    and so she had to do it over again: and this time she got the prayer-book.
    </p>
    <p>
    After that Mrs Donnelly played Miss McCloud’s Reel for the children and
    Joe made Maria take a glass of wine. Soon they were all quite merry again and
    Mrs Donnelly said Maria would enter a convent before the year was out because
    she had got the prayer-book. Maria had never seen Joe so nice to her as he was
    that night, so full of pleasant talk and reminiscences. She said they were all
    very good to her.
    </p>
    <p>
    At last the children grew tired and sleepy and Joe asked Maria would she not
    sing some little song before she went, one of the old songs. Mrs Donnelly said
    <i>“Do, please, Maria!”</i> and so Maria had to get up and stand
    beside the piano. Mrs Donnelly bade the children be quiet and listen to
    Maria’s song. Then she played the prelude and said <i>“Now,
    Maria!”</i> and Maria, blushing very much began to sing in a tiny
    quavering voice. She sang <i>I Dreamt that I Dwelt</i>, and when she came to
    the second verse she sang again:
    </p>
    <lg rhyme="ABAB"><l>I dreamt that I dwelt in marble <rhyme label="A">halls</rhyme></l><l>With vassals and serfs at my <rhyme label="B">side</rhyme></l><l>And of all who assembled within those <rhyme label="A">walls</rhyme></l><l>That I was the hope and the <rhyme label="B">pride</rhyme>.</l><l>I had riches too great to count, could <rhyme label="A">boast</rhyme></l><l>Of a high ancestral <rhyme label="B">name</rhyme>,</l><l>But I also dreamt, which pleased me <rhyme label="A">most</rhyme>,</l><l>That you loved me still the <rhyme label="B">same</rhyme>.</l></lg>
    <p>
    But no one tried to show her her mistake; and when she had ended her song Joe
    was very much moved. He said that there was no time like the long ago and no
    music for him like poor old Balfe, whatever other people might say; and his
    eyes filled up so much with tears that he could not find what he was looking
    for and in the end he had to ask his wife to tell him where the corkscrew was.
    </p>
    </div>




```python
# Update quotations to align with TEI guidelines (Chapter 3.5.2)
paragraphs = div.find_all('p')
for paragraph in paragraphs:
    quotations = paragraph.find_all('i') # quote and quotations are in italic
    for quotation in quotations:
        if quotation.text[0] == '“': # if it is a direct quote
            quotation.name = 'q' # we use quoted: "contains material which is distinguished from the surrounding text using
                                 # quotation marks or a similar method, for any one of a variety of reasons including, but not limited to: 
                                 # direct speech or thought, technical terms or jargon, authorial distance, quotations from elsewhere, 
                                 # and passages that are mentioned but not used
            print(quotation) 
        else: # if it is not a direct quote
            quotation.name = 'q' # we use quotation: "(quotation) contains a phrase or passage attributed
                                 # by the narrator or author to some agency external to the text."
            print(quotation)
```

    <q>“Yes, my dear,”</q>
    <q>“No, my dear.”</q>
    <q>A Present from Belfast</q>
    <q>Dublin
    by Lamplight</q>
    <q>“O, here’s Maria!”</q>
    <q>O, I know all about it!</q>
    <q>“Do, please, Maria!”</q>
    <q>“Now,
    Maria!”</q>
    <q>I Dreamt that I Dwelt</q>
    


```python
print(soup.prettify())
```

    <TEI xmlns="http://www.tei-c.org/ns/1.0">
     <body>
      <div n="10" type="chapter" xml:id="DUB10">
       <head>
        CLAY
       </head>
       <p>
        The matron had given her leave to go out as soon as the women’s tea was
    over and Maria looked forward to her evening out. The kitchen was spick and
    span: the cook said you could see yourself in the big copper boilers. The fire
    was nice and bright and on one of the side-tables were four very big
    barmbracks. These barmbracks seemed uncut; but if you went closer you would see
    that they had been cut into long thick even slices and were ready to be handed
    round at tea. Maria had cut them herself.
       </p>
       <p>
        Maria was a very, very small person indeed but she had a very long nose and a
    very long chin. She talked a little through her nose, always soothingly:
        <q>
         “Yes, my dear,”
        </q>
        and
        <q>
         “No, my dear.”
        </q>
        She
    was always sent for when the women quarrelled over their tubs and always
    succeeded in making peace. One day the matron had said to her:
       </p>
       <p>
        “Maria, you are a veritable peace-maker!”
       </p>
       <p>
        And the sub-matron and two of the Board ladies had heard the compliment. And
    Ginger Mooney was always saying what she wouldn’t do to the dummy who had
    charge of the irons if it wasn’t for Maria. Everyone was so fond of
    Maria.
       </p>
       <p>
        The women would have their tea at six o’clock and she would be able to
    get away before seven. From Ballsbridge to the Pillar, twenty minutes; from the
    Pillar to Drumcondra, twenty minutes; and twenty minutes to buy the things. She
    would be there before eight. She took out her purse with the silver clasps and
    read again the words
        <q>
         A Present from Belfast
        </q>
        . She was very fond of that
    purse because Joe had brought it to her five years before when he and Alphy had
    gone to Belfast on a Whit-Monday trip. In the purse were two half-crowns and
    some coppers. She would have five shillings clear after paying tram fare. What
    a nice evening they would have, all the children singing! Only she hoped that
    Joe wouldn’t come in drunk. He was so different when he took any drink.
       </p>
       <p>
        Often he had wanted her to go and live with them; but she would have felt
    herself in the way (though Joe’s wife was ever so nice with her) and she
    had become accustomed to the life of the laundry. Joe was a good fellow. She
    had nursed him and Alphy too; and Joe used often say:
       </p>
       <p>
        “Mamma is mamma but Maria is my proper mother.”
       </p>
       <p>
        After the break-up at home the boys had got her that position in the
        <q>
         Dublin
    by Lamplight
        </q>
        laundry, and she liked it. She used to have such a bad opinion
    of Protestants but now she thought they were very nice people, a little quiet
    and serious, but still very nice people to live with. Then she had her plants
    in the conservatory and she liked looking after them. She had lovely ferns and
    wax-plants and, whenever anyone came to visit her, she always gave the visitor
    one or two slips from her conservatory. There was one thing she didn’t
    like and that was the tracts on the walks; but the matron was such a nice
    person to deal with, so genteel.
       </p>
       <p>
        When the cook told her everything was ready she went into the women’s
    room and began to pull the big bell. In a few minutes the women began to come
    in by twos and threes, wiping their steaming hands in their petticoats and
    pulling down the sleeves of their blouses over their red steaming arms. They
    settled down before their huge mugs which the cook and the dummy filled up with
    hot tea, already mixed with milk and sugar in huge tin cans. Maria
    superintended the distribution of the barmbrack and saw that every woman got
    her four slices. There was a great deal of laughing and joking during the meal.
    Lizzie Fleming said Maria was sure to get the ring and, though Fleming had said
    that for so many Hallow Eves, Maria had to laugh and say she didn’t want
    any ring or man either; and when she laughed her grey-green eyes sparkled with
    disappointed shyness and the tip of her nose nearly met the tip of her chin.
    Then Ginger Mooney lifted up her mug of tea and proposed Maria’s health
    while all the other women clattered with their mugs on the table, and said she
    was sorry she hadn’t a sup of porter to drink it in. And Maria laughed
    again till the tip of her nose nearly met the tip of her chin and till her
    minute body nearly shook itself asunder because she knew that Mooney meant well
    though, of course, she had the notions of a common woman.
       </p>
       <p>
        But wasn’t Maria glad when the women had finished their tea and the cook
    and the dummy had begun to clear away the tea-things! She went into her little
    bedroom and, remembering that the next morning was a mass morning, changed the
    hand of the alarm from seven to six. Then she took off her working skirt and
    her house-boots and laid her best skirt out on the bed and her tiny dress-boots
    beside the foot of the bed. She changed her blouse too and, as she stood before
    the mirror, she thought of how she used to dress for mass on Sunday morning
    when she was a young girl; and she looked with quaint affection at the
    diminutive body which she had so often adorned. In spite of its years she found
    it a nice tidy little body.
       </p>
       <p>
        When she got outside the streets were shining with rain and she was glad of her
    old brown waterproof. The tram was full and she had to sit on the little stool
    at the end of the car, facing all the people, with her toes barely touching the
    floor. She arranged in her mind all she was going to do and thought how much
    better it was to be independent and to have your own money in your pocket. She
    hoped they would have a nice evening. She was sure they would but she could not
    help thinking what a pity it was Alphy and Joe were not speaking. They were
    always falling out now but when they were boys together they used to be the
    best of friends: but such was life.
       </p>
       <p>
        She got out of her tram at the Pillar and ferreted her way quickly among the
    crowds. She went into Downes’s cake-shop but the shop was so full of
    people that it was a long time before she could get herself attended to. She
    bought a dozen of mixed penny cakes, and at last came out of the shop laden
    with a big bag. Then she thought what else would she buy: she wanted to buy
    something really nice. They would be sure to have plenty of apples and nuts. It
    was hard to know what to buy and all she could think of was cake. She decided
    to buy some plumcake but Downes’s plumcake had not enough almond icing on
    top of it so she went over to a shop in Henry Street. Here she was a long time
    in suiting herself and the stylish young lady behind the counter, who was
    evidently a little annoyed by her, asked her was it wedding-cake she wanted to
    buy. That made Maria blush and smile at the young lady; but the young lady took
    it all very seriously and finally cut a thick slice of plumcake, parcelled it
    up and said:
       </p>
       <p>
        “Two-and-four, please.”
       </p>
       <p>
        She thought she would have to stand in the Drumcondra tram because none of the
    young men seemed to notice her but an elderly gentleman made room for her. He
    was a stout gentleman and he wore a brown hard hat; he had a square red face
    and a greyish moustache. Maria thought he was a colonel-looking gentleman and
    she reflected how much more polite he was than the young men who simply stared
    straight before them. The gentleman began to chat with her about Hallow Eve and
    the rainy weather. He supposed the bag was full of good things for the little
    ones and said it was only right that the youngsters should enjoy themselves
    while they were young. Maria agreed with him and favoured him with demure nods
    and hems. He was very nice with her, and when she was getting out at the Canal
    Bridge she thanked him and bowed, and he bowed to her and raised his hat and
    smiled agreeably, and while she was going up along the terrace, bending her
    tiny head under the rain, she thought how easy it was to know a gentleman even
    when he has a drop taken.
       </p>
       <p>
        Everybody said:
        <q>
         “O, here’s Maria!”
        </q>
        when she came to
    Joe’s house. Joe was there, having come home from business, and all the
    children had their Sunday dresses on. There were two big girls in from next
    door and games were going on. Maria gave the bag of cakes to the eldest boy,
    Alphy, to divide and Mrs Donnelly said it was too good of her to bring such a
    big bag of cakes and made all the children say:
       </p>
       <p>
        “Thanks, Maria.”
       </p>
       <p>
        But Maria said she had brought something special for papa and mamma, something
    they would be sure to like, and she began to look for her plumcake. She tried
    in Downes’s bag and then in the pockets of her waterproof and then on the
    hallstand but nowhere could she find it. Then she asked all the children had
    any of them eaten it—by mistake, of course—but the children all
    said no and looked as if they did not like to eat cakes if they were to be
    accused of stealing. Everybody had a solution for the mystery and Mrs Donnelly
    said it was plain that Maria had left it behind her in the tram. Maria,
    remembering how confused the gentleman with the greyish moustache had made her,
    coloured with shame and vexation and disappointment. At the thought of the
    failure of her little surprise and of the two and fourpence she had thrown away
    for nothing she nearly cried outright.
       </p>
       <p>
        But Joe said it didn’t matter and made her sit down by the fire. He was
    very nice with her. He told her all that went on in his office, repeating for
    her a smart answer which he had made to the manager. Maria did not understand
    why Joe laughed so much over the answer he had made but she said that the
    manager must have been a very overbearing person to deal with. Joe said he
    wasn’t so bad when you knew how to take him, that he was a decent sort so
    long as you didn’t rub him the wrong way. Mrs Donnelly played the piano
    for the children and they danced and sang. Then the two next-door girls handed
    round the nuts. Nobody could find the nutcrackers and Joe was nearly getting
    cross over it and asked how did they expect Maria to crack nuts without a
    nutcracker. But Maria said she didn’t like nuts and that they
    weren’t to bother about her. Then Joe asked would she take a bottle of
    stout and Mrs Donnelly said there was port wine too in the house if she would
    prefer that. Maria said she would rather they didn’t ask her to take
    anything: but Joe insisted.
       </p>
       <p>
        So Maria let him have his way and they sat by the fire talking over old times
    and Maria thought she would put in a good word for Alphy. But Joe cried that
    God might strike him stone dead if ever he spoke a word to his brother again
    and Maria said she was sorry she had mentioned the matter. Mrs Donnelly told
    her husband it was a great shame for him to speak that way of his own flesh and
    blood but Joe said that Alphy was no brother of his and there was nearly being
    a row on the head of it. But Joe said he would not lose his temper on account
    of the night it was and asked his wife to open some more stout. The two
    next-door girls had arranged some Hallow Eve games and soon everything was
    merry again. Maria was delighted to see the children so merry and Joe and his
    wife in such good spirits. The next-door girls put some saucers on the table
    and then led the children up to the table, blindfold. One got the prayer-book
    and the other three got the water; and when one of the next-door girls got the
    ring Mrs Donnelly shook her finger at the blushing girl as much as to say:
        <q>
         O, I know all about it!
        </q>
        They insisted then on blindfolding Maria and
    leading her up to the table to see what she would get; and, while they were
    putting on the bandage, Maria laughed and laughed again till the tip of her
    nose nearly met the tip of her chin.
       </p>
       <p>
        They led her up to the table amid laughing and joking and she put her hand out
    in the air as she was told to do. She moved her hand about here and there in
    the air and descended on one of the saucers. She felt a soft wet substance with
    her fingers and was surprised that nobody spoke or took off her bandage. There
    was a pause for a few seconds; and then a great deal of scuffling and
    whispering. Somebody said something about the garden, and at last Mrs Donnelly
    said something very cross to one of the next-door girls and told her to throw
    it out at once: that was no play. Maria understood that it was wrong that time
    and so she had to do it over again: and this time she got the prayer-book.
       </p>
       <p>
        After that Mrs Donnelly played Miss McCloud’s Reel for the children and
    Joe made Maria take a glass of wine. Soon they were all quite merry again and
    Mrs Donnelly said Maria would enter a convent before the year was out because
    she had got the prayer-book. Maria had never seen Joe so nice to her as he was
    that night, so full of pleasant talk and reminiscences. She said they were all
    very good to her.
       </p>
       <p>
        At last the children grew tired and sleepy and Joe asked Maria would she not
    sing some little song before she went, one of the old songs. Mrs Donnelly said
        <q>
         “Do, please, Maria!”
        </q>
        and so Maria had to get up and stand
    beside the piano. Mrs Donnelly bade the children be quiet and listen to
    Maria’s song. Then she played the prelude and said
        <q>
         “Now,
    Maria!”
        </q>
        and Maria, blushing very much began to sing in a tiny
    quavering voice. She sang
        <q>
         I Dreamt that I Dwelt
        </q>
        , and when she came to
    the second verse she sang again:
       </p>
       <lg rhyme="ABAB">
        <l>
         I dreamt that I dwelt in marble
         <rhyme label="A">
          halls
         </rhyme>
        </l>
        <l>
         With vassals and serfs at my
         <rhyme label="B">
          side
         </rhyme>
        </l>
        <l>
         And of all who assembled within those
         <rhyme label="A">
          walls
         </rhyme>
        </l>
        <l>
         That I was the hope and the
         <rhyme label="B">
          pride
         </rhyme>
         .
        </l>
        <l>
         I had riches too great to count, could
         <rhyme label="A">
          boast
         </rhyme>
        </l>
        <l>
         Of a high ancestral
         <rhyme label="B">
          name
         </rhyme>
         ,
        </l>
        <l>
         But I also dreamt, which pleased me
         <rhyme label="A">
          most
         </rhyme>
         ,
        </l>
        <l>
         That you loved me still the
         <rhyme label="B">
          same
         </rhyme>
         .
        </l>
       </lg>
       <p>
        But no one tried to show her her mistake; and when she had ended her song Joe
    was very much moved. He said that there was no time like the long ago and no
    music for him like poor old Balfe, whatever other people might say; and his
    eyes filled up so much with tears that he could not find what he was looking
    for and in the end he had to ask his wife to tell him where the corkscrew was.
       </p>
      </div>
      <!--end chapter-->
     </body>
    </TEI>
    
    

# Tasks

Please use the new HTML document "A_Little_Cloud_except.html" and complete the following tasks:<br>
(1) Convert the provided HTML document to an XML document, and parse the xml document using Beautiful Soup (you may copy the codes above and simply modify the file directory accordingly). (0.5 points);<br>
(2) Update the root element, the div element, and the header to align with the TEI guidelines (you may copy the codes above and change the "div['xml:id']" and "div['n']"). (0.5 points);<br>
(3) Update the poem paragraphs and each line of the poem paragraphs, and replace the poem paragraphs with the new paragraphs elements (you may copy the codes above. Since there are multiple poem paragraphs in the document, consider implementing a for loop to update each of them, and create new paragraphs elements to replace each poem paragraphs). (0.5 points);<br>
(4) There is no \<i> element in this document. Is there a way to identify the quotations and quotes in the document? Write a short paragraph on how you would solve this issue (you have to propose a solution, or at least outline some ideas to tackle this issue. Actual code implementation is not required). (0.5 points);<br>
(5) Reflect on the process of converting HTML to TEI. Share your insights and takeaways, focusing on various aspects. Consider discussing: (a) What are the challenges encountered during the conversion process? (b) Whether aligning with TEI guidelines is useful? Why or why not? Feel free to provide any other perspectives you have gained from this task. (0.5 points)


```python
import re
new_document = open('Data/A_Little_Cloud_excerpt.html', mode = 'r', encoding='utf-8')

htmldoc = html.fromstring(new_document.read())
open("Data/A_Little_Cloud_excerpt.xml", 'wb').write(etree.tostring(htmldoc))
xml_document = open('Data/A_Little_Cloud_excerpt.xml', mode = 'r')
soup = BeautifulSoup(xml_document, 'lxml')

root = soup.find()
root.name = 'TEI'
del root['lang']
del root['xml:lang']
root['xmlns'] = 'http://www.tei-c.org/ns/1.0'

body = soup.find('body')
div = body.find('div')
del div['class']
div['xml:id'] = 'DUB08'
div['n'] = 8
div['type'] = 'chapter'

head = div.find('h2')
head.name = 'head'
a = head.find('a')
a.extract()

poem_paragraphs = div.find_all('p', 'poem')
for poem_paragraph in poem_paragraphs:
    del poem_paragraph['class']
    poem_paragraph.name = 'lg'
    poem_paragraph['rhyme'] = 'ABAB'
    poem_text = poem_paragraph.find('i')
    poem_text.unwrap()
    
for poem_paragraph in poem_paragraphs:
    poem_text = poem_paragraph.stripped_strings
    new_poem_paragraph = soup.new_tag('lg', rhyme=poem_paragraph['rhyme'])
    
    count = 0
    for line in poem_text:
        new_tag = soup.new_tag('l')
        new_tag.string = ' '.join(line.split()[:-1]) + ' '
        if count %2 == 0:
            rhyme_tag = soup.new_tag('rhyme', label='A')
            matches = re.findall(r'(\w+|[^\w]+)', line.split()[-1])
            if len(matches)==1:
                rhyme_tag.string = matches[0]
                new_tag.append(rhyme_tag)
            else:
                rhyme_tag.string = matches[0]
                new_tag.append(rhyme_tag)
                new_tag.append(matches[1])
        else:
            rhyme_tag = soup.new_tag('rhyme', label='B')
            matches = re.findall(r'(\w+|[^\w]+)', line.split()[-1])
            if len(matches)==1:
                rhyme_tag.string = matches[0]
                new_tag.append(rhyme_tag)
            else:
                rhyme_tag.string = matches[0]
                new_tag.append(rhyme_tag)
                new_tag.append(matches[1])
        new_poem_paragraph.append(new_tag)
        count += 1
    poem_paragraph.replace_with(new_poem_paragraph)

print(soup.prettify())
```

    <TEI xmlns="http://www.tei-c.org/ns/1.0">
     <body>
      <div n="8" type="chapter" xml:id="DUB08">
       <head>
        A LITTLE CLOUD
       </head>
       <p>
        Little Chandler sat in the room off the hall, holding a child in his arms. To
    save money they kept no servant but Annie’s young sister Monica came for
    an hour or so in the morning and an hour or so in the evening to help. But
    Monica had gone home long ago. It was a quarter to nine. Little Chandler had
    come home late for tea and, moreover, he had forgotten to bring Annie home the
    parcel of coffee from Bewley’s. Of course she was in a bad humour and
    gave him short answers. She said she would do without any tea but when it came
    near the time at which the shop at the corner closed she decided to go out
    herself for a quarter of a pound of tea and two pounds of sugar. She put the
    sleeping child deftly in his arms and said:
       </p>
       <p>
        “Here. Don’t waken him.”
       </p>
       <p>
        A little lamp with a white china shade stood upon the table and its light fell
    over a photograph which was enclosed in a frame of crumpled horn. It was
    Annie’s photograph. Little Chandler looked at it, pausing at the thin
    tight lips. She wore the pale blue summer blouse which he had brought her home
    as a present one Saturday. It had cost him ten and elevenpence; but what an
    agony of nervousness it had cost him! How he had suffered that day, waiting at
    the shop door until the shop was empty, standing at the counter and trying to
    appear at his ease while the girl piled ladies’ blouses before him,
    paying at the desk and forgetting to take up the odd penny of his change, being
    called back by the cashier, and finally, striving to hide his blushes as he
    left the shop by examining the parcel to see if it was securely tied. When he
    brought the blouse home Annie kissed him and said it was very pretty and
    stylish; but when she heard the price she threw the blouse on the table and
    said it was a regular swindle to charge ten and elevenpence for it. At first
    she wanted to take it back but when she tried it on she was delighted with it,
    especially with the make of the sleeves, and kissed him and said he was very
    good to think of her.
       </p>
       <p>
        Hm!...
       </p>
       <p>
        He looked coldly into the eyes of the photograph and they answered coldly.
    Certainly they were pretty and the face itself was pretty. But he found
    something mean in it. Why was it so unconscious and ladylike? The composure of
    the eyes irritated him. They repelled him and defied him: there was no passion
    in them, no rapture. He thought of what Gallaher had said about rich Jewesses.
    Those dark Oriental eyes, he thought, how full they are of passion, of
    voluptuous longing!... Why had he married the eyes in the photograph?
       </p>
       <p>
        He caught himself up at the question and glanced nervously round the room. He
    found something mean in the pretty furniture which he had bought for his house
    on the hire system. Annie had chosen it herself and it reminded him of her. It
    too was prim and pretty. A dull resentment against his life awoke within him.
    Could he not escape from his little house? Was it too late for him to try to
    live bravely like Gallaher? Could he go to London? There was the furniture
    still to be paid for. If he could only write a book and get it published, that
    might open the way for him.
       </p>
       <p>
        A volume of Byron’s poems lay before him on the table. He opened it
    cautiously with his left hand lest he should waken the child and began to read
    the first poem in the book:
       </p>
       <lg rhyme="ABAB">
        <l>
         Hushed are the winds and still the evening
         <rhyme label="A">
          gloom
         </rhyme>
         ,
        </l>
        <l>
         Not e’en a Zephyr wanders through the
         <rhyme label="B">
          grove
         </rhyme>
         ,
        </l>
        <l>
         Whilst I return to view my Margaret’s
         <rhyme label="A">
          tomb
         </rhyme>
        </l>
        <l>
         And scatter flowers on the dust I
         <rhyme label="B">
          love
         </rhyme>
         .
        </l>
       </lg>
       <p>
        He paused. He felt the rhythm of the verse about him in the room. How
    melancholy it was! Could he, too, write like that, express the melancholy of
    his soul in verse? There were so many things he wanted to describe: his
    sensation of a few hours before on Grattan Bridge, for example. If he could get
    back again into that mood....
       </p>
       <p>
        The child awoke and began to cry. He turned from the page and tried to hush it:
    but it would not be hushed. He began to rock it to and fro in his arms but its
    wailing cry grew keener. He rocked it faster while his eyes began to read the
    second stanza:
       </p>
       <lg rhyme="ABAB">
        <l>
         Within this narrow cell reclines her
         <rhyme label="A">
          clay
         </rhyme>
         ,
        </l>
        <l>
         That clay where
         <rhyme label="B">
          once
         </rhyme>
         ....
        </l>
       </lg>
       <p>
        It was useless. He couldn’t read. He couldn’t do anything. The
    wailing of the child pierced the drum of his ear. It was useless, useless! He
    was a prisoner for life. His arms trembled with anger and suddenly bending to
    the child’s face he shouted:
       </p>
       <p>
        “Stop!”
       </p>
       <p>
        The child stopped for an instant, had a spasm of fright and began to scream. He
    jumped up from his chair and walked hastily up and down the room with the child
    in his arms. It began to sob piteously, losing its breath for four or five
    seconds, and then bursting out anew. The thin walls of the room echoed the
    sound. He tried to soothe it but it sobbed more convulsively. He looked at the
    contracted and quivering face of the child and began to be alarmed. He counted
    seven sobs without a break between them and caught the child to his breast in
    fright. If it died!...
       </p>
       <p>
        The door was burst open and a young woman ran in, panting.
       </p>
       <p>
        “What is it? What is it?” she cried.
       </p>
       <p>
        The child, hearing its mother’s voice, broke out into a paroxysm of
    sobbing.
       </p>
       <p>
        “It’s nothing, Annie ... it’s nothing.... He began to
    cry....”
       </p>
       <p>
        She flung her parcels on the floor and snatched the child from him.
       </p>
       <p>
        “What have you done to him?” she cried, glaring into his face.
       </p>
       <p>
        Little Chandler sustained for one moment the gaze of her eyes and his heart
    closed together as he met the hatred in them. He began to stammer:
       </p>
       <p>
        “It’s nothing.... He ... he began to cry.... I couldn’t ... I
    didn’t do anything.... What?”
       </p>
       <p>
        Giving no heed to him she began to walk up and down the room, clasping the
    child tightly in her arms and murmuring:
       </p>
       <p>
        “My little man! My little mannie! Was ’ou frightened, love?...
    There now, love! There now!... Lambabaun! Mamma’s little lamb of the
    world!... There now!”
       </p>
       <p>
        Little Chandler felt his cheeks suffused with shame and he stood back out of
    the lamplight. He listened while the paroxysm of the child’s sobbing grew
    less and less; and tears of remorse started to his eyes.
       </p>
      </div>
      <!--end chapter-->
     </body>
    </TEI>
    
    
