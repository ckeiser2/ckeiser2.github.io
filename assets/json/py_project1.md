```python
import pandas as pd
import numpy as np
import re
! pip install nltk
import nltk
nltk.download('stopwords')
# Gensim, for topic modeling
import gensim
import gensim.corpora as corpora
from gensim.utils import simple_preprocess
from gensim.models import CoherenceModel

# Plotting tools
import matplotlib.pyplot as plt
%matplotlib inline
```

    Requirement already satisfied: nltk in c:\users\colto\anaconda3\lib\site-packages (3.8.1)
    Requirement already satisfied: click in c:\users\colto\anaconda3\lib\site-packages (from nltk) (8.0.4)
    Requirement already satisfied: joblib in c:\users\colto\anaconda3\lib\site-packages (from nltk) (1.2.0)
    Requirement already satisfied: regex>=2021.8.3 in c:\users\colto\anaconda3\lib\site-packages (from nltk) (2022.7.9)
    Requirement already satisfied: tqdm in c:\users\colto\anaconda3\lib\site-packages (from nltk) (4.65.0)
    Requirement already satisfied: colorama in c:\users\colto\anaconda3\lib\site-packages (from click->nltk) (0.4.6)
    

    [nltk_data] Downloading package stopwords to
    [nltk_data]     C:\Users\colto\AppData\Roaming\nltk_data...
    [nltk_data]   Unzipping corpora\stopwords.zip.
    


```python
df = pd.read_csv("Data/YoutubeVideoEssayProject.csv")
df = df.drop(columns ="Unnamed: 9")
df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Title</th>
      <th>Views</th>
      <th>Likes</th>
      <th>Date</th>
      <th>Length</th>
      <th>Transcript</th>
      <th>Description</th>
      <th>Creator</th>
      <th>Creator Subscribers</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>David Lynch: The Treachery of Language</td>
      <td>275,647</td>
      <td>14,000</td>
      <td>3/30/18</td>
      <td>11:10</td>
      <td>0:00\n[Interviewer] “David Lynch has described...</td>
      <td>David Lynch is famous for his reluctance to ve...</td>
      <td>What's So Great About That?</td>
      <td>79,900</td>
    </tr>
    <tr>
      <th>1</th>
      <td>CTRL+ALT+DEL | SLA:3</td>
      <td>2,400,000</td>
      <td>83,000</td>
      <td>4/27/18</td>
      <td>34:10</td>
      <td>0:00\nHi, I'm Hareton Splimby, and welcome to ...</td>
      <td>In attempting to go fast, Hareton Splimby suff...</td>
      <td>hbomberguy</td>
      <td>1,290,000</td>
    </tr>
    <tr>
      <th>2</th>
      <td>The Hobbit: A Long-Expected Autopsy (Part 1/2)</td>
      <td>5,000,000</td>
      <td>126,000</td>
      <td>3/28/18</td>
      <td>36:48</td>
      <td>0:07\nIn mid-2015, less than a year before her...</td>
      <td>In which we look back at The Hobbit trilogy an...</td>
      <td>Lindsay Ellis</td>
      <td>5,086,953</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Making Games Better for Gamers with Colourblin...</td>
      <td>370,306</td>
      <td>19,000</td>
      <td>8/22/18</td>
      <td>13:55</td>
      <td>0:00\nVideo games are for everyone, and they c...</td>
      <td>Video games are for everyone. But disabled peo...</td>
      <td>Game Maker's Toolkit</td>
      <td>1,510,000</td>
    </tr>
    <tr>
      <th>4</th>
      <td>FAKE FRIENDS EPISODE TWO: parasocial hell</td>
      <td>224,898</td>
      <td>10,000</td>
      <td>8/11/18</td>
      <td>1:54:34</td>
      <td>0:03\n[Shannon] Grape-kun was a real-life peng...</td>
      <td>it's done!!!!\n\n \n\n / struccimovies  \nhttp...</td>
      <td>StrucciMovies</td>
      <td>46,700</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Incels | ContraPoints</td>
      <td>5,823,697</td>
      <td>243,000</td>
      <td>8/17/18</td>
      <td>34:05</td>
      <td>0:00\n[Mendelssohn: String Quartet No. 6 in F ...</td>
      <td>Hello boys. Let's talk about bone structure.\n...</td>
      <td>ContraPoints</td>
      <td>5,823,697</td>
    </tr>
    <tr>
      <th>6</th>
      <td>DOOM: The Fake Outrage</td>
      <td>845,440</td>
      <td>38,000</td>
      <td>9/1/18</td>
      <td>24:32</td>
      <td>0:00\nhello everyone today we're going to be\n...</td>
      <td>Countdown to the first accusation of meta-meta...</td>
      <td>Shaun</td>
      <td>662,000</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Disney - The Magic of Animation</td>
      <td>610,400</td>
      <td>45,000</td>
      <td>10/3/18</td>
      <td>15:47</td>
      <td>0:00\nforeign\n0:07\nwhat is it about Disney A...</td>
      <td>A look at the 12 principles of animation devel...</td>
      <td>kaptainkristian</td>
      <td>45,000</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Nostalghia Critique</td>
      <td>106,500</td>
      <td>5,400</td>
      <td>11/27/18</td>
      <td>9:11</td>
      <td>0:07\nThere are a few things you can't do on Y...</td>
      <td>A reflection on cinema, self, and other nonsen...</td>
      <td>KyleKallgreen</td>
      <td>80,800</td>
    </tr>
    <tr>
      <th>9</th>
      <td>In Search Of A Flat Earth</td>
      <td>3,423,150</td>
      <td>129,000</td>
      <td>9/11/20</td>
      <td>1:16:16</td>
      <td>Prologue\n0:00\n[Laid back folk music] A few m...</td>
      <td>Clickbait Title: The Twist at 37 Minutes Will ...</td>
      <td>Folding Ideas</td>
      <td>892,000</td>
    </tr>
    <tr>
      <th>10</th>
      <td>The Satirical Resurgence of Reefer Madness</td>
      <td>81,974</td>
      <td>6,900</td>
      <td>11/10/20</td>
      <td>26:58</td>
      <td>Transcript</td>
      <td>https://www.snap4freedom.org/home\n \n\n / yha...</td>
      <td>Yhara zayd</td>
      <td>242,000</td>
    </tr>
    <tr>
      <th>11</th>
      <td>The Strange Reality of Roller Coaster Tycoon</td>
      <td>1,383,521</td>
      <td>55,000</td>
      <td>7/19/20</td>
      <td>18:11</td>
      <td>0:09\nThere is at least one roller coaster des...</td>
      <td>Both birds are yellow but the louder one is ye...</td>
      <td>Jacob Geller</td>
      <td>1,150,000</td>
    </tr>
    <tr>
      <th>12</th>
      <td>CATS &amp; The Weird Mind of TS Eliot | An Analysis</td>
      <td>334,188</td>
      <td>16,000</td>
      <td>3/24/20</td>
      <td>58:50</td>
      <td>0:12\nthe speaking on eliot is a difficult mat...</td>
      <td>If you want to directly support me and see thi...</td>
      <td>Maggie Mae Fish</td>
      <td>221,000</td>
    </tr>
    <tr>
      <th>13</th>
      <td>The Anatomy of Stan Culture</td>
      <td>108,681</td>
      <td>8,200</td>
      <td>3/8/20</td>
      <td>18:28</td>
      <td>0:00\nthe audience is important to any\n0:01\n...</td>
      <td>How much do you love celebrities? As a fan, wh...</td>
      <td>Intelexual Media</td>
      <td>281,000</td>
    </tr>
    <tr>
      <th>14</th>
      <td>On Writing: Mental Illness in Video Games | a ...</td>
      <td>246,532</td>
      <td>21,000</td>
      <td>4/3/20</td>
      <td>33:33</td>
      <td>0:00\nthis video is going to deal with sensiti...</td>
      <td>It's only because of independent support throu...</td>
      <td>Hello Future Me</td>
      <td>1,008,000</td>
    </tr>
    <tr>
      <th>15</th>
      <td>Why Anime is for Black People - Hip Hop x Anim...</td>
      <td>180,348</td>
      <td>15,000</td>
      <td>9/25/20</td>
      <td>18:34</td>
      <td>0:00\nanybody who's been alive in the past 20\...</td>
      <td>Over the years, it's hard not to point out ani...</td>
      <td>Beyond The Bot</td>
      <td>84,100</td>
    </tr>
    <tr>
      <th>16</th>
      <td>What Is *Good* Queer Representation in 2020?</td>
      <td>181,933</td>
      <td>12,000</td>
      <td>8/14/20</td>
      <td>48:21</td>
      <td>0:00\nthis was actually a really difficult vid...</td>
      <td>Clips and Spoilers from the following shows:\n...</td>
      <td>Princess Weekes</td>
      <td>222,000</td>
    </tr>
    <tr>
      <th>17</th>
      <td>Fallout: New Vegas Is Genius, And Here's Why</td>
      <td>9,754,066</td>
      <td>251,000</td>
      <td>12/19/20</td>
      <td>1:37:41</td>
      <td>0:00\n- The first two "Fallouts" are still two...</td>
      <td>(Spoilers for New Vegas, obviously)\n\nMy Twit...</td>
      <td>hbomberguy</td>
      <td>1,290,000</td>
    </tr>
    <tr>
      <th>18</th>
      <td>Whisper of the Heart: How Does It Feel to Be a...</td>
      <td>126,458</td>
      <td>9,500</td>
      <td>5/28/20</td>
      <td>13:30</td>
      <td>0:03\n"Alright..."\n0:05\n"And action!"\n0:06\...</td>
      <td>Accented Cinema - Episode 37\n\nThis is a bit ...</td>
      <td>Accented Cinema</td>
      <td>456,000</td>
    </tr>
    <tr>
      <th>19</th>
      <td>Your Island is a Commune pt. 1 | Nowhere Grotesk</td>
      <td>87,724</td>
      <td>7,300</td>
      <td>1/11/20</td>
      <td>22:31</td>
      <td>0:00\nI've never engaged with the game the way...</td>
      <td>Capitalism or community, choose one. Join us n...</td>
      <td>Nowhere Grotesk</td>
      <td>8,510</td>
    </tr>
    <tr>
      <th>20</th>
      <td>The Market of Humiliating Black Women</td>
      <td>939,173</td>
      <td>102,000</td>
      <td>2/22/21</td>
      <td>26:11</td>
      <td>0:00\nHi everyone. Welcome to this video.  My ...</td>
      <td>Hey cuties welcome back :) In today's video I'...</td>
      <td>Tee Noir</td>
      <td>631,000</td>
    </tr>
    <tr>
      <th>21</th>
      <td>The Day Rue "Became" Black</td>
      <td>1,965,436</td>
      <td>126,000</td>
      <td>5/19/21</td>
      <td>35:33</td>
      <td>0:00\nGreetings and salutations, before we get...</td>
      <td>Go to https://nordvpn.com/yhara or use code yh...</td>
      <td>Yhara zayd</td>
      <td>242,000</td>
    </tr>
    <tr>
      <th>22</th>
      <td>Infantilization and the Body Hair Debate</td>
      <td>1,930,899</td>
      <td>140,000</td>
      <td>8/14/21</td>
      <td>35:40</td>
      <td>1:09\n﻿So, I got Brazilian wax recently. [cric...</td>
      <td>it took 13 hours to edit this.\nSOCIALS:\nko-f...</td>
      <td>Shanspeare</td>
      <td>590,000</td>
    </tr>
    <tr>
      <th>23</th>
      <td>Bo Burnham vs. Jeff Bezos</td>
      <td>1,345,904</td>
      <td>80,000</td>
      <td>8/20/21</td>
      <td>2:26:41</td>
      <td>0:01\n[ Screams ] Every book of the Bible was ...</td>
      <td>COVID make man sad\n\nPatreon:  \n\n / cjthex ...</td>
      <td>CJ The X</td>
      <td>297,000</td>
    </tr>
    <tr>
      <th>24</th>
      <td>The reign of the Slim-Thick Influencer | Khadi...</td>
      <td>1,886,067</td>
      <td>114,000</td>
      <td>8/22/21</td>
      <td>54:18</td>
      <td>0:00\nThis video is brought to you by Squaresp...</td>
      <td>Head to ​https://www.squarespace.com/khadijamb...</td>
      <td>Khadija Mbowe</td>
      <td>611,000</td>
    </tr>
    <tr>
      <th>25</th>
      <td>make more characters bi, you cowards: why (not...</td>
      <td>8,217</td>
      <td>NaN</td>
      <td>8/28/21</td>
      <td>51:16</td>
      <td>0:00\nhello void and all who inhabit it, it's ...</td>
      <td>sorry again for the glitchy video. the perks o...</td>
      <td>voice memos for the void</td>
      <td>10,000</td>
    </tr>
    <tr>
      <th>26</th>
      <td>The Black Right Wing || Anansi’s Library</td>
      <td>26,220</td>
      <td>2,400</td>
      <td>9/24/21</td>
      <td>8:17</td>
      <td>0:00\nour justice system is gone blm has taken...</td>
      <td>NEW TWITTER:  \n\n / localpunkanansi   NEW PAT...</td>
      <td>Anansi's Library</td>
      <td>25,200</td>
    </tr>
    <tr>
      <th>27</th>
      <td>On Leftist Disunity</td>
      <td>72,060</td>
      <td>7,200</td>
      <td>10/27/21</td>
      <td>11:34</td>
      <td>0:00\nNot long after I’d become radicalized, b...</td>
      <td>Watch the whole video before commenting. As I’...</td>
      <td>Andrewism</td>
      <td>161,000</td>
    </tr>
    <tr>
      <th>28</th>
      <td>Break Bread</td>
      <td>751,463</td>
      <td>50,000</td>
      <td>12/6/21</td>
      <td>1:40:30</td>
      <td>0:04\nso in the following years as the anti-sj...</td>
      <td>After a few months of “success” on the platfor...</td>
      <td>F.D Signifier</td>
      <td>611,000</td>
    </tr>
    <tr>
      <th>29</th>
      <td>Meet Dave | Captain Ahab: The Story of Dave St...</td>
      <td>828,195</td>
      <td>18,000</td>
      <td>3/1/22</td>
      <td>48:33</td>
      <td>0:00\n(pulsing music)\n0:05\n- [Jon] It's the ...</td>
      <td>“Who’s Dave Stieb?” you might be asking. Well,...</td>
      <td>Secret Base</td>
      <td>1,360,000</td>
    </tr>
    <tr>
      <th>30</th>
      <td>Why Panzer Dragoon Saga is the Greatest RPG No...</td>
      <td>112,523</td>
      <td>6,700</td>
      <td>6/24/22</td>
      <td>53:30</td>
      <td>0:02\nearth may not be forever but we still ha...</td>
      <td>This is the story of the most important and in...</td>
      <td>Micheal Saba</td>
      <td>86,300</td>
    </tr>
    <tr>
      <th>31</th>
      <td>Nice White Teachers, Bad Brown Schools: Hollyw...</td>
      <td>331,890</td>
      <td>22,000</td>
      <td>6/25/22</td>
      <td>40:53</td>
      <td>0:18\nthis video is brought to you by mubi a c...</td>
      <td>Hirokazu Koreeda: A Double Bill is now streami...</td>
      <td>Yhara zayd</td>
      <td>242,000</td>
    </tr>
    <tr>
      <th>32</th>
      <td>Instagram Hates Its Users</td>
      <td>1,001,437</td>
      <td>57,000</td>
      <td>8/31/22</td>
      <td>31:33</td>
      <td>0:00\neveryone is mad at instagram right now a...</td>
      <td>Use code JARVIS130 to get $130 off across 6 Fa...</td>
      <td>Jarvis Johnson</td>
      <td>2,040,000</td>
    </tr>
    <tr>
      <th>33</th>
      <td>Fixing My Brain with Automated Therapy</td>
      <td>979,429</td>
      <td>57,000</td>
      <td>9/2/22</td>
      <td>52:50</td>
      <td>0:00\nnow when we hear the word therapy, certa...</td>
      <td>People laugh about this, self-soothing engines...</td>
      <td>Jacob Geller</td>
      <td>1,150,000</td>
    </tr>
    <tr>
      <th>34</th>
      <td>Parking lots are everywhere and nowhere</td>
      <td>13,904</td>
      <td>1,200</td>
      <td>9/22/22</td>
      <td>11:34</td>
      <td>0:00\nWe all have those formative childhood ex...</td>
      <td>Parking lots are the ambient architecture of a...</td>
      <td>What's So Great About That?</td>
      <td>79,900</td>
    </tr>
    <tr>
      <th>35</th>
      <td>How Degrowth Can Save The World</td>
      <td>136,004</td>
      <td>9,700</td>
      <td>11/2/22</td>
      <td>36:54</td>
      <td>0:00\nour world is dying. Or more accurately, ...</td>
      <td>Capitalism is based on the cancerous logic of ...</td>
      <td>Andrewism</td>
      <td>161,000</td>
    </tr>
  </tbody>
</table>
</div>




```python
#cleaned text in df
def clean_text(list_): 
    regex_newline = re.compile(r'\n')
    regex_timestamp = re.compile(r'\d:\d\d')
    regex_whitespace = re.compile(r'\s{2,}')
    for index, item in enumerate(list_):
        item = str(item)
        item = re.sub(regex_newline, " ", item)
        item = re.sub(regex_timestamp, " ", item)
        item = re.sub(regex_whitespace, " ", item)
        item = re.sub(r'"', "", item)
        item = re.sub(r'\s1\s', ' ', item)
        item = re.sub(r'\s2\s', ' ', item)
        list_[index] = item
    return list_
df["Transcript"] = clean_text(df["Transcript"])
df["Description"] = clean_text(df["Description"])
df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Title</th>
      <th>Views</th>
      <th>Likes</th>
      <th>Date</th>
      <th>Length</th>
      <th>Transcript</th>
      <th>Description</th>
      <th>Creator</th>
      <th>Creator Subscribers</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>David Lynch: The Treachery of Language</td>
      <td>275,647</td>
      <td>14,000</td>
      <td>3/30/18</td>
      <td>11:10</td>
      <td>[Interviewer] “David Lynch has described his ...</td>
      <td>David Lynch is famous for his reluctance to ve...</td>
      <td>What's So Great About That?</td>
      <td>79,900</td>
    </tr>
    <tr>
      <th>1</th>
      <td>CTRL+ALT+DEL | SLA:3</td>
      <td>2,400,000</td>
      <td>83,000</td>
      <td>4/27/18</td>
      <td>34:10</td>
      <td>Hi, I'm Hareton Splimby, and welcome to Serio...</td>
      <td>In attempting to go fast, Hareton Splimby suff...</td>
      <td>hbomberguy</td>
      <td>1,290,000</td>
    </tr>
    <tr>
      <th>2</th>
      <td>The Hobbit: A Long-Expected Autopsy (Part 1/2)</td>
      <td>5,000,000</td>
      <td>126,000</td>
      <td>3/28/18</td>
      <td>36:48</td>
      <td>In mid-2015, less than a year before her deat...</td>
      <td>In which we look back at The Hobbit trilogy an...</td>
      <td>Lindsay Ellis</td>
      <td>5,086,953</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Making Games Better for Gamers with Colourblin...</td>
      <td>370,306</td>
      <td>19,000</td>
      <td>8/22/18</td>
      <td>13:55</td>
      <td>Video games are for everyone, and they can ev...</td>
      <td>Video games are for everyone. But disabled peo...</td>
      <td>Game Maker's Toolkit</td>
      <td>1,510,000</td>
    </tr>
    <tr>
      <th>4</th>
      <td>FAKE FRIENDS EPISODE TWO: parasocial hell</td>
      <td>224,898</td>
      <td>10,000</td>
      <td>8/11/18</td>
      <td>1:54:34</td>
      <td>[Shannon] Grape-kun was a real-life penguin t...</td>
      <td>it's done!!!! / struccimovies https://ko-fi.co...</td>
      <td>StrucciMovies</td>
      <td>46,700</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Incels | ContraPoints</td>
      <td>5,823,697</td>
      <td>243,000</td>
      <td>8/17/18</td>
      <td>34:05</td>
      <td>[Mendelssohn: String Quartet No. 6 in F minor...</td>
      <td>Hello boys. Let's talk about bone structure. S...</td>
      <td>ContraPoints</td>
      <td>5,823,697</td>
    </tr>
    <tr>
      <th>6</th>
      <td>DOOM: The Fake Outrage</td>
      <td>845,440</td>
      <td>38,000</td>
      <td>9/1/18</td>
      <td>24:32</td>
      <td>hello everyone today we're going to be talkin...</td>
      <td>Countdown to the first accusation of meta-meta...</td>
      <td>Shaun</td>
      <td>662,000</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Disney - The Magic of Animation</td>
      <td>610,400</td>
      <td>45,000</td>
      <td>10/3/18</td>
      <td>15:47</td>
      <td>foreign what is it about Disney Animation tha...</td>
      <td>A look at the 12 principles of animation devel...</td>
      <td>kaptainkristian</td>
      <td>45,000</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Nostalghia Critique</td>
      <td>106,500</td>
      <td>5,400</td>
      <td>11/27/18</td>
      <td>9:11</td>
      <td>There are a few things you can't do on YouTub...</td>
      <td>A reflection on cinema, self, and other nonsen...</td>
      <td>KyleKallgreen</td>
      <td>80,800</td>
    </tr>
    <tr>
      <th>9</th>
      <td>In Search Of A Flat Earth</td>
      <td>3,423,150</td>
      <td>129,000</td>
      <td>9/11/20</td>
      <td>1:16:16</td>
      <td>Prologue [Laid back folk music] A few minutes ...</td>
      <td>Clickbait Title: The Twist at 37 Minutes Will ...</td>
      <td>Folding Ideas</td>
      <td>892,000</td>
    </tr>
    <tr>
      <th>10</th>
      <td>The Satirical Resurgence of Reefer Madness</td>
      <td>81,974</td>
      <td>6,900</td>
      <td>11/10/20</td>
      <td>26:58</td>
      <td>Transcript</td>
      <td>https://www.snap4freedom.org/home / yharazayd ...</td>
      <td>Yhara zayd</td>
      <td>242,000</td>
    </tr>
    <tr>
      <th>11</th>
      <td>The Strange Reality of Roller Coaster Tycoon</td>
      <td>1,383,521</td>
      <td>55,000</td>
      <td>7/19/20</td>
      <td>18:11</td>
      <td>There is at least one roller coaster designed...</td>
      <td>Both birds are yellow but the louder one is ye...</td>
      <td>Jacob Geller</td>
      <td>1,150,000</td>
    </tr>
    <tr>
      <th>12</th>
      <td>CATS &amp; The Weird Mind of TS Eliot | An Analysis</td>
      <td>334,188</td>
      <td>16,000</td>
      <td>3/24/20</td>
      <td>58:50</td>
      <td>the speaking on eliot is a difficult matter, ...</td>
      <td>If you want to directly support me and see thi...</td>
      <td>Maggie Mae Fish</td>
      <td>221,000</td>
    </tr>
    <tr>
      <th>13</th>
      <td>The Anatomy of Stan Culture</td>
      <td>108,681</td>
      <td>8,200</td>
      <td>3/8/20</td>
      <td>18:28</td>
      <td>the audience is important to any celebrity's ...</td>
      <td>How much do you love celebrities? As a fan, wh...</td>
      <td>Intelexual Media</td>
      <td>281,000</td>
    </tr>
    <tr>
      <th>14</th>
      <td>On Writing: Mental Illness in Video Games | a ...</td>
      <td>246,532</td>
      <td>21,000</td>
      <td>4/3/20</td>
      <td>33:33</td>
      <td>this video is going to deal with sensitive an...</td>
      <td>It's only because of independent support throu...</td>
      <td>Hello Future Me</td>
      <td>1,008,000</td>
    </tr>
    <tr>
      <th>15</th>
      <td>Why Anime is for Black People - Hip Hop x Anim...</td>
      <td>180,348</td>
      <td>15,000</td>
      <td>9/25/20</td>
      <td>18:34</td>
      <td>anybody who's been alive in the past 20 years...</td>
      <td>Over the years, it's hard not to point out ani...</td>
      <td>Beyond The Bot</td>
      <td>84,100</td>
    </tr>
    <tr>
      <th>16</th>
      <td>What Is *Good* Queer Representation in 2020?</td>
      <td>181,933</td>
      <td>12,000</td>
      <td>8/14/20</td>
      <td>48:21</td>
      <td>this was actually a really difficult video to...</td>
      <td>Clips and Spoilers from the following shows: S...</td>
      <td>Princess Weekes</td>
      <td>222,000</td>
    </tr>
    <tr>
      <th>17</th>
      <td>Fallout: New Vegas Is Genius, And Here's Why</td>
      <td>9,754,066</td>
      <td>251,000</td>
      <td>12/19/20</td>
      <td>1:37:41</td>
      <td>- The first two Fallouts are still two of the...</td>
      <td>(Spoilers for New Vegas, obviously) My Twitter...</td>
      <td>hbomberguy</td>
      <td>1,290,000</td>
    </tr>
    <tr>
      <th>18</th>
      <td>Whisper of the Heart: How Does It Feel to Be a...</td>
      <td>126,458</td>
      <td>9,500</td>
      <td>5/28/20</td>
      <td>13:30</td>
      <td>Alright... And action! Being an artist myself...</td>
      <td>Accented Cinema - Episode 37 This is a bit of ...</td>
      <td>Accented Cinema</td>
      <td>456,000</td>
    </tr>
    <tr>
      <th>19</th>
      <td>Your Island is a Commune pt. 1 | Nowhere Grotesk</td>
      <td>87,724</td>
      <td>7,300</td>
      <td>1/11/20</td>
      <td>22:31</td>
      <td>I've never engaged with the game the way I do...</td>
      <td>Capitalism or community, choose one. Join us n...</td>
      <td>Nowhere Grotesk</td>
      <td>8,510</td>
    </tr>
    <tr>
      <th>20</th>
      <td>The Market of Humiliating Black Women</td>
      <td>939,173</td>
      <td>102,000</td>
      <td>2/22/21</td>
      <td>26:11</td>
      <td>Hi everyone. Welcome to this video. My name i...</td>
      <td>Hey cuties welcome back :) In today's video I'...</td>
      <td>Tee Noir</td>
      <td>631,000</td>
    </tr>
    <tr>
      <th>21</th>
      <td>The Day Rue "Became" Black</td>
      <td>1,965,436</td>
      <td>126,000</td>
      <td>5/19/21</td>
      <td>35:33</td>
      <td>Greetings and salutations, before we get into...</td>
      <td>Go to https://nordvpn.com/yhara or use code yh...</td>
      <td>Yhara zayd</td>
      <td>242,000</td>
    </tr>
    <tr>
      <th>22</th>
      <td>Infantilization and the Body Hair Debate</td>
      <td>1,930,899</td>
      <td>140,000</td>
      <td>8/14/21</td>
      <td>35:40</td>
      <td>﻿So, I got Brazilian wax recently. [crickets]...</td>
      <td>it took 13 hours to edit this. SOCIALS: ko-fi:...</td>
      <td>Shanspeare</td>
      <td>590,000</td>
    </tr>
    <tr>
      <th>23</th>
      <td>Bo Burnham vs. Jeff Bezos</td>
      <td>1,345,904</td>
      <td>80,000</td>
      <td>8/20/21</td>
      <td>2:26:41</td>
      <td>[ Screams ] Every book of the Bible was writt...</td>
      <td>COVID make man sad Patreon: / cjthex Twitter: ...</td>
      <td>CJ The X</td>
      <td>297,000</td>
    </tr>
    <tr>
      <th>24</th>
      <td>The reign of the Slim-Thick Influencer | Khadi...</td>
      <td>1,886,067</td>
      <td>114,000</td>
      <td>8/22/21</td>
      <td>54:18</td>
      <td>This video is brought to you by Squarespace. ...</td>
      <td>Head to ​https://www.squarespace.com/khadijamb...</td>
      <td>Khadija Mbowe</td>
      <td>611,000</td>
    </tr>
    <tr>
      <th>25</th>
      <td>make more characters bi, you cowards: why (not...</td>
      <td>8,217</td>
      <td>NaN</td>
      <td>8/28/21</td>
      <td>51:16</td>
      <td>hello void and all who inhabit it, it's me an...</td>
      <td>sorry again for the glitchy video. the perks o...</td>
      <td>voice memos for the void</td>
      <td>10,000</td>
    </tr>
    <tr>
      <th>26</th>
      <td>The Black Right Wing || Anansi’s Library</td>
      <td>26,220</td>
      <td>2,400</td>
      <td>9/24/21</td>
      <td>8:17</td>
      <td>our justice system is gone blm has taken over...</td>
      <td>NEW TWITTER: / localpunkanansi NEW PATREON LIN...</td>
      <td>Anansi's Library</td>
      <td>25,200</td>
    </tr>
    <tr>
      <th>27</th>
      <td>On Leftist Disunity</td>
      <td>72,060</td>
      <td>7,200</td>
      <td>10/27/21</td>
      <td>11:34</td>
      <td>Not long after I’d become radicalized, began ...</td>
      <td>Watch the whole video before commenting. As I’...</td>
      <td>Andrewism</td>
      <td>161,000</td>
    </tr>
    <tr>
      <th>28</th>
      <td>Break Bread</td>
      <td>751,463</td>
      <td>50,000</td>
      <td>12/6/21</td>
      <td>1:40:30</td>
      <td>so in the following years as the anti-sjw cha...</td>
      <td>After a few months of “success” on the platfor...</td>
      <td>F.D Signifier</td>
      <td>611,000</td>
    </tr>
    <tr>
      <th>29</th>
      <td>Meet Dave | Captain Ahab: The Story of Dave St...</td>
      <td>828,195</td>
      <td>18,000</td>
      <td>3/1/22</td>
      <td>48:33</td>
      <td>(pulsing music) - [Jon] It's the final game o...</td>
      <td>“Who’s Dave Stieb?” you might be asking. Well,...</td>
      <td>Secret Base</td>
      <td>1,360,000</td>
    </tr>
    <tr>
      <th>30</th>
      <td>Why Panzer Dragoon Saga is the Greatest RPG No...</td>
      <td>112,523</td>
      <td>6,700</td>
      <td>6/24/22</td>
      <td>53:30</td>
      <td>earth may not be forever but we still have th...</td>
      <td>This is the story of the most important and in...</td>
      <td>Micheal Saba</td>
      <td>86,300</td>
    </tr>
    <tr>
      <th>31</th>
      <td>Nice White Teachers, Bad Brown Schools: Hollyw...</td>
      <td>331,890</td>
      <td>22,000</td>
      <td>6/25/22</td>
      <td>40:53</td>
      <td>this video is brought to you by mubi a curate...</td>
      <td>Hirokazu Koreeda: A Double Bill is now streami...</td>
      <td>Yhara zayd</td>
      <td>242,000</td>
    </tr>
    <tr>
      <th>32</th>
      <td>Instagram Hates Its Users</td>
      <td>1,001,437</td>
      <td>57,000</td>
      <td>8/31/22</td>
      <td>31:33</td>
      <td>everyone is mad at instagram right now and fo...</td>
      <td>Use code JARVIS130 to get $130 off across 6 Fa...</td>
      <td>Jarvis Johnson</td>
      <td>2,040,000</td>
    </tr>
    <tr>
      <th>33</th>
      <td>Fixing My Brain with Automated Therapy</td>
      <td>979,429</td>
      <td>57,000</td>
      <td>9/2/22</td>
      <td>52:50</td>
      <td>now when we hear the word therapy, certain th...</td>
      <td>People laugh about this, self-soothing engines...</td>
      <td>Jacob Geller</td>
      <td>1,150,000</td>
    </tr>
    <tr>
      <th>34</th>
      <td>Parking lots are everywhere and nowhere</td>
      <td>13,904</td>
      <td>1,200</td>
      <td>9/22/22</td>
      <td>11:34</td>
      <td>We all have those formative childhood experie...</td>
      <td>Parking lots are the ambient architecture of a...</td>
      <td>What's So Great About That?</td>
      <td>79,900</td>
    </tr>
    <tr>
      <th>35</th>
      <td>How Degrowth Can Save The World</td>
      <td>136,004</td>
      <td>9,700</td>
      <td>11/2/22</td>
      <td>36:54</td>
      <td>our world is dying. Or more accurately, it is...</td>
      <td>Capitalism is based on the cancerous logic of ...</td>
      <td>Andrewism</td>
      <td>161,000</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Initialize TfidfVectorizer, using English stopwords and converting words to lowercase
from sklearn.feature_extraction.text import TfidfVectorizer
tfidf_vectorizer = TfidfVectorizer(stop_words='english', lowercase=True)
```


```python
tfidf_matrix = tfidf_vectorizer.fit_transform(df['Transcript']) # Generate a matrix
tfidf_df = pd.DataFrame(tfidf_matrix.toarray(), columns=tfidf_vectorizer.get_feature_names_out()) # Convert matrix to dataframe
tfidf_df.set_index(df['Title'], inplace=True) 
tfidf_df = tfidf_df.stack().reset_index()
tfidf_df = tfidf_df.rename(columns={0:'tfidf', 'Title': 'document','level_1': 'term'})
tfidf_df.sort_values(by=['document','tfidf'], ascending=[True,False]).groupby(['document']).head(1)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>document</th>
      <th>term</th>
      <th>tfidf</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>306869</th>
      <td>Bo Burnham vs. Jeff Bezos</td>
      <td>bezos</td>
      <td>0.593870</td>
    </tr>
    <tr>
      <th>374618</th>
      <td>Break Bread</td>
      <td>content</td>
      <td>0.307921</td>
    </tr>
    <tr>
      <th>163352</th>
      <td>CATS &amp; The Weird Mind of TS Eliot | An Analysis</td>
      <td>eliot</td>
      <td>0.510959</td>
    </tr>
    <tr>
      <th>15631</th>
      <td>CTRL+ALT+DEL | SLA:3</td>
      <td>comic</td>
      <td>0.354365</td>
    </tr>
    <tr>
      <th>83354</th>
      <td>DOOM: The Fake Outrage</td>
      <td>doom</td>
      <td>0.477031</td>
    </tr>
    <tr>
      <th>7132</th>
      <td>David Lynch: The Treachery of Language</td>
      <td>lynch</td>
      <td>0.663959</td>
    </tr>
    <tr>
      <th>93322</th>
      <td>Disney - The Magic of Animation</td>
      <td>action</td>
      <td>0.376898</td>
    </tr>
    <tr>
      <th>58408</th>
      <td>FAKE FRIENDS EPISODE TWO: parasocial hell</td>
      <td>grape</td>
      <td>0.437322</td>
    </tr>
    <tr>
      <th>230324</th>
      <td>Fallout: New Vegas Is Genius, And Here's Why</td>
      <td>fallout</td>
      <td>0.400686</td>
    </tr>
    <tr>
      <th>442363</th>
      <td>Fixing My Brain with Automated Therapy</td>
      <td>eliza</td>
      <td>0.331601</td>
    </tr>
    <tr>
      <th>470344</th>
      <td>How Degrowth Can Save The World</td>
      <td>growth</td>
      <td>0.429553</td>
    </tr>
    <tr>
      <th>124277</th>
      <td>In Search Of A Flat Earth</td>
      <td>flat</td>
      <td>0.596912</td>
    </tr>
    <tr>
      <th>72416</th>
      <td>Incels | ContraPoints</td>
      <td>incels</td>
      <td>0.568979</td>
    </tr>
    <tr>
      <th>297674</th>
      <td>Infantilization and the Body Hair Debate</td>
      <td>hair</td>
      <td>0.393264</td>
    </tr>
    <tr>
      <th>431326</th>
      <td>Instagram Hates Its Users</td>
      <td>instagram</td>
      <td>0.592285</td>
    </tr>
    <tr>
      <th>42176</th>
      <td>Making Games Better for Gamers with Colourblin...</td>
      <td>colour</td>
      <td>0.305557</td>
    </tr>
    <tr>
      <th>396597</th>
      <td>Meet Dave | Captain Ahab: The Story of Dave St...</td>
      <td>stieb</td>
      <td>0.667119</td>
    </tr>
    <tr>
      <th>423654</th>
      <td>Nice White Teachers, Bad Brown Schools: Hollyw...</td>
      <td>teachers</td>
      <td>0.389858</td>
    </tr>
    <tr>
      <th>108495</th>
      <td>Nostalghia Critique</td>
      <td>clips</td>
      <td>0.305741</td>
    </tr>
    <tr>
      <th>365537</th>
      <td>On Leftist Disunity</td>
      <td>left</td>
      <td>0.302464</td>
    </tr>
    <tr>
      <th>194845</th>
      <td>On Writing: Mental Illness in Video Games | a ...</td>
      <td>player</td>
      <td>0.357307</td>
    </tr>
    <tr>
      <th>453521</th>
      <td>Parking lots are everywhere and nowhere</td>
      <td>car</td>
      <td>0.339618</td>
    </tr>
    <tr>
      <th>174633</th>
      <td>The Anatomy of Stan Culture</td>
      <td>celebrity</td>
      <td>0.539281</td>
    </tr>
    <tr>
      <th>346796</th>
      <td>The Black Right Wing || Anansi’s Library</td>
      <td>black</td>
      <td>0.342267</td>
    </tr>
    <tr>
      <th>289197</th>
      <td>The Day Rue "Became" Black</td>
      <td>rue</td>
      <td>0.445351</td>
    </tr>
    <tr>
      <th>32224</th>
      <td>The Hobbit: A Long-Expected Autopsy (Part 1/2)</td>
      <td>hobbit</td>
      <td>0.543211</td>
    </tr>
    <tr>
      <th>267080</th>
      <td>The Market of Humiliating Black Women</td>
      <td>black</td>
      <td>0.325939</td>
    </tr>
    <tr>
      <th>145030</th>
      <td>The Satirical Resurgence of Reefer Madness</td>
      <td>transcript</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>148394</th>
      <td>The Strange Reality of Roller Coaster Tycoon</td>
      <td>coaster</td>
      <td>0.635670</td>
    </tr>
    <tr>
      <th>320313</th>
      <td>The reign of the Slim-Thick Influencer | Khadi...</td>
      <td>body</td>
      <td>0.376040</td>
    </tr>
    <tr>
      <th>221973</th>
      <td>What Is *Good* Queer Representation in 2020?</td>
      <td>queer</td>
      <td>0.537510</td>
    </tr>
    <tr>
      <th>249805</th>
      <td>Whisper of the Heart: How Does It Feel to Be a...</td>
      <td>shizuku</td>
      <td>0.315560</td>
    </tr>
    <tr>
      <th>199964</th>
      <td>Why Anime is for Black People - Hip Hop x Anim...</td>
      <td>anime</td>
      <td>0.524849</td>
    </tr>
    <tr>
      <th>402265</th>
      <td>Why Panzer Dragoon Saga is the Greatest RPG No...</td>
      <td>dragoon</td>
      <td>0.515901</td>
    </tr>
    <tr>
      <th>265197</th>
      <td>Your Island is a Commune pt. 1 | Nowhere Grotesk</td>
      <td>village</td>
      <td>0.433637</td>
    </tr>
    <tr>
      <th>333442</th>
      <td>make more characters bi, you cowards: why (not...</td>
      <td>bi</td>
      <td>0.721916</td>
    </tr>
  </tbody>
</table>
</div>




```python
!pip install altair
```

    Requirement already satisfied: altair in c:\users\colto\anaconda3\lib\site-packages (5.1.2)
    Requirement already satisfied: jinja2 in c:\users\colto\anaconda3\lib\site-packages (from altair) (3.1.2)
    Requirement already satisfied: jsonschema>=3.0 in c:\users\colto\anaconda3\lib\site-packages (from altair) (4.17.3)
    Requirement already satisfied: numpy in c:\users\colto\anaconda3\lib\site-packages (from altair) (1.24.3)
    Requirement already satisfied: packaging in c:\users\colto\anaconda3\lib\site-packages (from altair) (23.1)
    Requirement already satisfied: pandas>=0.25 in c:\users\colto\anaconda3\lib\site-packages (from altair) (2.0.3)
    Requirement already satisfied: toolz in c:\users\colto\anaconda3\lib\site-packages (from altair) (0.12.0)
    Requirement already satisfied: attrs>=17.4.0 in c:\users\colto\anaconda3\lib\site-packages (from jsonschema>=3.0->altair) (22.1.0)
    Requirement already satisfied: pyrsistent!=0.17.0,!=0.17.1,!=0.17.2,>=0.14.0 in c:\users\colto\anaconda3\lib\site-packages (from jsonschema>=3.0->altair) (0.18.0)
    Requirement already satisfied: python-dateutil>=2.8.2 in c:\users\colto\anaconda3\lib\site-packages (from pandas>=0.25->altair) (2.8.2)
    Requirement already satisfied: pytz>=2020.1 in c:\users\colto\anaconda3\lib\site-packages (from pandas>=0.25->altair) (2023.3.post1)
    Requirement already satisfied: tzdata>=2022.1 in c:\users\colto\anaconda3\lib\site-packages (from pandas>=0.25->altair) (2023.3)
    Requirement already satisfied: MarkupSafe>=2.0 in c:\users\colto\anaconda3\lib\site-packages (from jinja2->altair) (2.1.1)
    Requirement already satisfied: six>=1.5 in c:\users\colto\anaconda3\lib\site-packages (from python-dateutil>=2.8.2->pandas>=0.25->altair) (1.16.0)
    


```python
# Some fancy visualizations to highlight the words with highest TF-IDF score in each inaugural address
import altair as alt

top_tfidf = tfidf_df.sort_values(by=['document','tfidf'], ascending=[True,False]).groupby(['document']).head(10)

# Terms in this list will get a red dot in the visualization
term_list = ['queer', 'peace']

# adding a little randomness to break ties in term ranking
top_tfidf_plusRand = top_tfidf.copy()
top_tfidf_plusRand['tfidf'] = top_tfidf_plusRand['tfidf'] + np.random.rand(top_tfidf.shape[0])*0.0001

# base for all visualizations, with rank calculation
base = alt.Chart(top_tfidf_plusRand).encode(
    x = 'rank:O',
    y = 'document:N'
).transform_window(
    rank = "rank()",
    sort = [alt.SortField("tfidf", order="descending")],
    groupby = ["document"],
)
# heatmap specification
heatmap = base.mark_rect().encode(
    color = 'tfidf:Q'
)

# red circle over terms in above list
circle = base.mark_circle(size=100).encode(
    color = alt.condition(
        alt.FieldOneOfPredicate(field='term', oneOf=term_list),
        alt.value('red'),
        alt.value('#FFFFFF00')        
    )
)

# text labels, white for darker heatmap colors
text = base.mark_text(baseline='middle').encode(
    text = 'term:N',
    color = alt.condition(alt.datum.tfidf >= 0.23, alt.value('white'), alt.value('black'))
)

# display the three superimposed visualizations
(heatmap + circle + text).properties(width = 600)
```





<style>
  #altair-viz-7ce468f9e70041609320839cefa84c22.vega-embed {
    width: 100%;
    display: flex;
  }

  #altair-viz-7ce468f9e70041609320839cefa84c22.vega-embed details,
  #altair-viz-7ce468f9e70041609320839cefa84c22.vega-embed details summary {
    position: relative;
  }
</style>
<div id="altair-viz-7ce468f9e70041609320839cefa84c22"></div>
<script type="text/javascript">
  var VEGA_DEBUG = (typeof VEGA_DEBUG == "undefined") ? {} : VEGA_DEBUG;
  (function(spec, embedOpt){
    let outputDiv = document.currentScript.previousElementSibling;
    if (outputDiv.id !== "altair-viz-7ce468f9e70041609320839cefa84c22") {
      outputDiv = document.getElementById("altair-viz-7ce468f9e70041609320839cefa84c22");
    }
    const paths = {
      "vega": "https://cdn.jsdelivr.net/npm/vega@5?noext",
      "vega-lib": "https://cdn.jsdelivr.net/npm/vega-lib?noext",
      "vega-lite": "https://cdn.jsdelivr.net/npm/vega-lite@5.15.1?noext",
      "vega-embed": "https://cdn.jsdelivr.net/npm/vega-embed@6?noext",
    };

    function maybeLoadScript(lib, version) {
      var key = `${lib.replace("-", "")}_version`;
      return (VEGA_DEBUG[key] == version) ?
        Promise.resolve(paths[lib]) :
        new Promise(function(resolve, reject) {
          var s = document.createElement('script');
          document.getElementsByTagName("head")[0].appendChild(s);
          s.async = true;
          s.onload = () => {
            VEGA_DEBUG[key] = version;
            return resolve(paths[lib]);
          };
          s.onerror = () => reject(`Error loading script: ${paths[lib]}`);
          s.src = paths[lib];
        });
    }

    function showError(err) {
      outputDiv.innerHTML = `<div class="error" style="color:red;">${err}</div>`;
      throw err;
    }

    function displayChart(vegaEmbed) {
      vegaEmbed(outputDiv, spec, embedOpt)
        .catch(err => showError(`Javascript Error: ${err.message}<br>This usually means there's a typo in your chart specification. See the javascript console for the full traceback.`));
    }

    if(typeof define === "function" && define.amd) {
      requirejs.config({paths});
      require(["vega-embed"], displayChart, err => showError(`Error loading script: ${err.message}`));
    } else {
      maybeLoadScript("vega", "5")
        .then(() => maybeLoadScript("vega-lite", "5.15.1"))
        .then(() => maybeLoadScript("vega-embed", "6"))
        .catch(showError)
        .then(() => displayChart(vegaEmbed));
    }
  })({"config": {"view": {"continuousWidth": 300, "continuousHeight": 300}}, "layer": [{"mark": {"type": "rect"}, "encoding": {"color": {"field": "tfidf", "type": "quantitative"}, "x": {"field": "rank", "type": "ordinal"}, "y": {"field": "document", "type": "nominal"}}, "transform": [{"window": [{"op": "rank", "field": "", "as": "rank"}], "groupby": ["document"], "sort": [{"field": "tfidf", "order": "descending"}]}]}, {"mark": {"type": "circle", "size": 100}, "encoding": {"color": {"condition": {"test": {"field": "term", "oneOf": ["queer", "peace"]}, "value": "red"}, "value": "#FFFFFF00"}, "x": {"field": "rank", "type": "ordinal"}, "y": {"field": "document", "type": "nominal"}}, "transform": [{"window": [{"op": "rank", "field": "", "as": "rank"}], "groupby": ["document"], "sort": [{"field": "tfidf", "order": "descending"}]}]}, {"mark": {"type": "text", "baseline": "middle"}, "encoding": {"color": {"condition": {"test": "(datum.tfidf >= 0.23)", "value": "white"}, "value": "black"}, "text": {"field": "term", "type": "nominal"}, "x": {"field": "rank", "type": "ordinal"}, "y": {"field": "document", "type": "nominal"}}, "transform": [{"window": [{"op": "rank", "field": "", "as": "rank"}], "groupby": ["document"], "sort": [{"field": "tfidf", "order": "descending"}]}]}], "data": {"name": "data-fac559ac08d69f7aca0e34b921d66c7b"}, "width": 600, "$schema": "https://vega.github.io/schema/vega-lite/v5.15.1.json", "datasets": {"data-fac559ac08d69f7aca0e34b921d66c7b": [{"document": "Bo Burnham vs. Jeff Bezos", "term": "bezos", "tfidf": 0.5938709548569286}, {"document": "Bo Burnham vs. Jeff Bezos", "term": "burnham", "tfidf": 0.2721314027968635}, {"document": "Bo Burnham vs. Jeff Bezos", "term": "bo", "tfidf": 0.16294122537674613}, {"document": "Bo Burnham vs. Jeff Bezos", "term": "jeffrey", "tfidf": 0.15845830032030875}, {"document": "Bo Burnham vs. Jeff Bezos", "term": "like", "tfidf": 0.14544643431177207}, {"document": "Bo Burnham vs. Jeff Bezos", "term": "jeff", "tfidf": 0.14522489704010197}, {"document": "Bo Burnham vs. Jeff Bezos", "term": "amazon", "tfidf": 0.1413040797135367}, {"document": "Bo Burnham vs. Jeff Bezos", "term": "comedy", "tfidf": 0.12576688922043797}, {"document": "Bo Burnham vs. Jeff Bezos", "term": "solo", "tfidf": 0.11838698847609888}, {"document": "Bo Burnham vs. Jeff Bezos", "term": "song", "tfidf": 0.11670285503448746}, {"document": "Break Bread", "term": "content", "tfidf": 0.3079730843285312}, {"document": "Break Bread", "term": "youtube", "tfidf": 0.2801038073772008}, {"document": "Break Bread", "term": "creators", "tfidf": 0.20582232147199245}, {"document": "Break Bread", "term": "like", "tfidf": 0.20351642003872736}, {"document": "Break Bread", "term": "channels", "tfidf": 0.16052918731166652}, {"document": "Break Bread", "term": "just", "tfidf": 0.15266906519644166}, {"document": "Break Bread", "term": "leftist", "tfidf": 0.1474734002132733}, {"document": "Break Bread", "term": "video", "tfidf": 0.14437048979498912}, {"document": "Break Bread", "term": "channel", "tfidf": 0.1433449447861049}, {"document": "Break Bread", "term": "tube", "tfidf": 0.13718381821137954}, {"document": "CATS & The Weird Mind of TS Eliot | An Analysis", "term": "eliot", "tfidf": 0.5109647034088561}, {"document": "CATS & The Weird Mind of TS Eliot | An Analysis", "term": "cats", "tfidf": 0.36336864315351264}, {"document": "CATS & The Weird Mind of TS Eliot | An Analysis", "term": "eliots", "tfidf": 0.22805630168029087}, {"document": "CATS & The Weird Mind of TS Eliot | An Analysis", "term": "body", "tfidf": 0.2062497078753195}, {"document": "CATS & The Weird Mind of TS Eliot | An Analysis", "term": "fascist", "tfidf": 0.14601605882741722}, {"document": "CATS & The Weird Mind of TS Eliot | An Analysis", "term": "deuteronomy", "tfidf": 0.13932846644675229}, {"document": "CATS & The Weird Mind of TS Eliot | An Analysis", "term": "ts", "tfidf": 0.12666242403643524}, {"document": "CATS & The Weird Mind of TS Eliot | An Analysis", "term": "poetry", "tfidf": 0.10433184752184833}, {"document": "CATS & The Weird Mind of TS Eliot | An Analysis", "term": "cat", "tfidf": 0.08621547366162902}, {"document": "CATS & The Weird Mind of TS Eliot | An Analysis", "term": "dance", "tfidf": 0.08589870400853132}, {"document": "CTRL+ALT+DEL | SLA:3", "term": "comic", "tfidf": 0.3544390416303559}, {"document": "CTRL+ALT+DEL | SLA:3", "term": "cad", "tfidf": 0.3030689932340148}, {"document": "CTRL+ALT+DEL | SLA:3", "term": "buckley", "tfidf": 0.22334738038685326}, {"document": "CTRL+ALT+DEL | SLA:3", "term": "ethan", "tfidf": 0.22336168644873142}, {"document": "CTRL+ALT+DEL | SLA:3", "term": "games", "tfidf": 0.1682044353487657}, {"document": "CTRL+ALT+DEL | SLA:3", "term": "arcade", "tfidf": 0.14359725642798818}, {"document": "CTRL+ALT+DEL | SLA:3", "term": "penny", "tfidf": 0.14356943551201692}, {"document": "CTRL+ALT+DEL | SLA:3", "term": "webcomic", "tfidf": 0.14363677055194737}, {"document": "CTRL+ALT+DEL | SLA:3", "term": "comics", "tfidf": 0.12872684670817047}, {"document": "CTRL+ALT+DEL | SLA:3", "term": "like", "tfidf": 0.12130966822387146}, {"document": "DOOM: The Fake Outrage", "term": "doom", "tfidf": 0.47708736409630015}, {"document": "DOOM: The Fake Outrage", "term": "sjw", "tfidf": 0.31357646092829145}, {"document": "DOOM: The Fake Outrage", "term": "trailer", "tfidf": 0.313571523420808}, {"document": "DOOM: The Fake Outrage", "term": "eternal", "tfidf": 0.25034506723462063}, {"document": "DOOM: The Fake Outrage", "term": "demons", "tfidf": 0.19090379073116764}, {"document": "DOOM: The Fake Outrage", "term": "game", "tfidf": 0.15825753736195333}, {"document": "DOOM: The Fake Outrage", "term": "outrage", "tfidf": 0.13771504561943154}, {"document": "DOOM: The Fake Outrage", "term": "anti", "tfidf": 0.12246828771207699}, {"document": "DOOM: The Fake Outrage", "term": "jokes", "tfidf": 0.11646755394991083}, {"document": "DOOM: The Fake Outrage", "term": "tweets", "tfidf": 0.10903638514266799}, {"document": "David Lynch: The Treachery of Language", "term": "lynch", "tfidf": 0.6639704093824245}, {"document": "David Lynch: The Treachery of Language", "term": "translation", "tfidf": 0.21526605346792776}, {"document": "David Lynch: The Treachery of Language", "term": "language", "tfidf": 0.18679355031124845}, {"document": "David Lynch: The Treachery of Language", "term": "words", "tfidf": 0.17337201656955523}, {"document": "David Lynch: The Treachery of Language", "term": "david", "tfidf": 0.15653242844257945}, {"document": "David Lynch: The Treachery of Language", "term": "spoken", "tfidf": 0.13703657843609485}, {"document": "David Lynch: The Treachery of Language", "term": "image", "tfidf": 0.1298519033468208}, {"document": "David Lynch: The Treachery of Language", "term": "written", "tfidf": 0.10790447655498141}, {"document": "David Lynch: The Treachery of Language", "term": "alphabet", "tfidf": 0.10220879874787979}, {"document": "David Lynch: The Treachery of Language", "term": "letters", "tfidf": 0.10217300869817013}, {"document": "Disney - The Magic of Animation", "term": "action", "tfidf": 0.3769611069897313}, {"document": "Disney - The Magic of Animation", "term": "animation", "tfidf": 0.2694328485173521}, {"document": "Disney - The Magic of Animation", "term": "frames", "tfidf": 0.19714152066768026}, {"document": "Disney - The Magic of Animation", "term": "disney", "tfidf": 0.1811704414631533}, {"document": "Disney - The Magic of Animation", "term": "principle", "tfidf": 0.17851442911575896}, {"document": "Disney - The Magic of Animation", "term": "squash", "tfidf": 0.17743008386123382}, {"document": "Disney - The Magic of Animation", "term": "stretch", "tfidf": 0.17737723712249429}, {"document": "Disney - The Magic of Animation", "term": "ease", "tfidf": 0.17668008522787618}, {"document": "Disney - The Magic of Animation", "term": "character", "tfidf": 0.15440484212484898}, {"document": "Disney - The Magic of Animation", "term": "anticipation", "tfidf": 0.14606728484532933}, {"document": "FAKE FRIENDS EPISODE TWO: parasocial hell", "term": "grape", "tfidf": 0.4373286048827925}, {"document": "FAKE FRIENDS EPISODE TWO: parasocial hell", "term": "kun", "tfidf": 0.3623666717599457}, {"document": "FAKE FRIENDS EPISODE TWO: parasocial hell", "term": "paro", "tfidf": 0.27489391255986173}, {"document": "FAKE FRIENDS EPISODE TWO: parasocial hell", "term": "penguin", "tfidf": 0.22495888356393998}, {"document": "FAKE FRIENDS EPISODE TWO: parasocial hell", "term": "robot", "tfidf": 0.17986070241388974}, {"document": "FAKE FRIENDS EPISODE TWO: parasocial hell", "term": "pepper", "tfidf": 0.1624750789723884}, {"document": "FAKE FRIENDS EPISODE TWO: parasocial hell", "term": "jack", "tfidf": 0.1542671112698681}, {"document": "FAKE FRIENDS EPISODE TWO: parasocial hell", "term": "like", "tfidf": 0.1474934671948033}, {"document": "FAKE FRIENDS EPISODE TWO: parasocial hell", "term": "waifu", "tfidf": 0.13744397646728587}, {"document": "FAKE FRIENDS EPISODE TWO: parasocial hell", "term": "zoo", "tfidf": 0.12496823781684566}, {"document": "Fallout: New Vegas Is Genius, And Here's Why", "term": "fallout", "tfidf": 0.4007069653378444}, {"document": "Fallout: New Vegas Is Genius, And Here's Why", "term": "vegas", "tfidf": 0.3286702418357831}, {"document": "Fallout: New Vegas Is Genius, And Here's Why", "term": "vault", "tfidf": 0.24752245352670707}, {"document": "Fallout: New Vegas Is Genius, And Here's Why", "term": "game", "tfidf": 0.21184378692767092}, {"document": "Fallout: New Vegas Is Genius, And Here's Why", "term": "perks", "tfidf": 0.16508134425178944}, {"document": "Fallout: New Vegas Is Genius, And Here's Why", "term": "quests", "tfidf": 0.16500629053472243}, {"document": "Fallout: New Vegas Is Genius, And Here's Why", "term": "quest", "tfidf": 0.14312901428020205}, {"document": "Fallout: New Vegas Is Genius, And Here's Why", "term": "like", "tfidf": 0.14138662502311383}, {"document": "Fallout: New Vegas Is Genius, And Here's Why", "term": "character", "tfidf": 0.13012112672208434}, {"document": "Fallout: New Vegas Is Genius, And Here's Why", "term": "new", "tfidf": 0.12797336204033205}, {"document": "Fixing My Brain with Automated Therapy", "term": "eliza", "tfidf": 0.33164852707708026}, {"document": "Fixing My Brain with Automated Therapy", "term": "app", "tfidf": 0.2931451021970992}, {"document": "Fixing My Brain with Automated Therapy", "term": "therapy", "tfidf": 0.26624328735632546}, {"document": "Fixing My Brain with Automated Therapy", "term": "apps", "tfidf": 0.22949970622422344}, {"document": "Fixing My Brain with Automated Therapy", "term": "youper", "tfidf": 0.20414249514111465}, {"document": "Fixing My Brain with Automated Therapy", "term": "computer", "tfidf": 0.18038321392372667}, {"document": "Fixing My Brain with Automated Therapy", "term": "im", "tfidf": 0.1785226474727898}, {"document": "Fixing My Brain with Automated Therapy", "term": "cbt", "tfidf": 0.16585001443618136}, {"document": "Fixing My Brain with Automated Therapy", "term": "bloom", "tfidf": 0.1276227416704756}, {"document": "Fixing My Brain with Automated Therapy", "term": "program", "tfidf": 0.12367233727611805}, {"document": "How Degrowth Can Save The World", "term": "growth", "tfidf": 0.4296272768028484}, {"document": "How Degrowth Can Save The World", "term": "economy", "tfidf": 0.23081487636361536}, {"document": "How Degrowth Can Save The World", "term": "capitalism", "tfidf": 0.21124064170385687}, {"document": "How Degrowth Can Save The World", "term": "energy", "tfidf": 0.16129012393842493}, {"document": "How Degrowth Can Save The World", "term": "need", "tfidf": 0.15650083768430978}, {"document": "How Degrowth Can Save The World", "term": "gdp", "tfidf": 0.1468847424247197}, {"document": "How Degrowth Can Save The World", "term": "growthism", "tfidf": 0.14684869388064317}, {"document": "How Degrowth Can Save The World", "term": "global", "tfidf": 0.11519546350466861}, {"document": "How Degrowth Can Save The World", "term": "capital", "tfidf": 0.10991336572655337}, {"document": "How Degrowth Can Save The World", "term": "dont", "tfidf": 0.10994041382531382}, {"document": "In Search Of A Flat Earth", "term": "flat", "tfidf": 0.5969746689259289}, {"document": "In Search Of A Flat Earth", "term": "earth", "tfidf": 0.45822111989417064}, {"document": "In Search Of A Flat Earth", "term": "lake", "tfidf": 0.3007769637096159}, {"document": "In Search Of A Flat Earth", "term": "earthers", "tfidf": 0.1451677472193085}, {"document": "In Search Of A Flat Earth", "term": "water", "tfidf": 0.13410070512202446}, {"document": "In Search Of A Flat Earth", "term": "like", "tfidf": 0.12239084849382438}, {"document": "In Search Of A Flat Earth", "term": "surface", "tfidf": 0.10723213144835099}, {"document": "In Search Of A Flat Earth", "term": "just", "tfidf": 0.09245600690500108}, {"document": "In Search Of A Flat Earth", "term": "belief", "tfidf": 0.08543666292900977}, {"document": "In Search Of A Flat Earth", "term": "minnewanka", "tfidf": 0.08297963804146655}, {"document": "Incels | ContraPoints", "term": "incels", "tfidf": 0.5690558034113599}, {"document": "Incels | ContraPoints", "term": "women", "tfidf": 0.27691463086552287}, {"document": "Incels | ContraPoints", "term": "incel", "tfidf": 0.22026766396699488}, {"document": "Incels | ContraPoints", "term": "men", "tfidf": 0.17586771791457467}, {"document": "Incels | ContraPoints", "term": "pill", "tfidf": 0.15076947973171376}, {"document": "Incels | ContraPoints", "term": "chad", "tfidf": 0.12752609481797147}, {"document": "Incels | ContraPoints", "term": "trans", "tfidf": 0.10898689772010861}, {"document": "Incels | ContraPoints", "term": "like", "tfidf": 0.10175963792829001}, {"document": "Incels | ContraPoints", "term": "bone", "tfidf": 0.09585698639800627}, {"document": "Incels | ContraPoints", "term": "skull", "tfidf": 0.09280769255648537}, {"document": "Infantilization and the Body Hair Debate", "term": "hair", "tfidf": 0.39328406123285126}, {"document": "Infantilization and the Body Hair Debate", "term": "women", "tfidf": 0.34756131637454807}, {"document": "Infantilization and the Body Hair Debate", "term": "lolita", "tfidf": 0.2852389505424344}, {"document": "Infantilization and the Body Hair Debate", "term": "body", "tfidf": 0.23587914605671836}, {"document": "Infantilization and the Body Hair Debate", "term": "hairy", "tfidf": 0.12180998176967499}, {"document": "Infantilization and the Body Hair Debate", "term": "feminine", "tfidf": 0.11447926396635608}, {"document": "Infantilization and the Body Hair Debate", "term": "wax", "tfidf": 0.10960928960693339}, {"document": "Infantilization and the Body Hair Debate", "term": "lesbian", "tfidf": 0.1006594348166205}, {"document": "Infantilization and the Body Hair Debate", "term": "like", "tfidf": 0.09619618599219149}, {"document": "Infantilization and the Body Hair Debate", "term": "hairless", "tfidf": 0.09509942427093014}, {"document": "Instagram Hates Its Users", "term": "instagram", "tfidf": 0.5923431461492105}, {"document": "Instagram Hates Its Users", "term": "tick", "tfidf": 0.271596015827493}, {"document": "Instagram Hates Its Users", "term": "app", "tfidf": 0.2582428169816243}, {"document": "Instagram Hates Its Users", "term": "tock", "tfidf": 0.2434796067415465}, {"document": "Instagram Hates Its Users", "term": "reels", "tfidf": 0.22477179571341355}, {"document": "Instagram Hates Its Users", "term": "feed", "tfidf": 0.20088701016820054}, {"document": "Instagram Hates Its Users", "term": "photos", "tfidf": 0.1865692053730876}, {"document": "Instagram Hates Its Users", "term": "like", "tfidf": 0.1645474400555235}, {"document": "Instagram Hates Its Users", "term": "creators", "tfidf": 0.1435455414277837}, {"document": "Instagram Hates Its Users", "term": "facebook", "tfidf": 0.11561719046638318}, {"document": "Making Games Better for Gamers with Colourblindness & Low Vision | Designing For Disability", "term": "colour", "tfidf": 0.3056246121373196}, {"document": "Making Games Better for Gamers with Colourblindness & Low Vision | Designing For Disability", "term": "colourblind", "tfidf": 0.3056482963839216}, {"document": "Making Games Better for Gamers with Colourblindness & Low Vision | Designing For Disability", "term": "colours", "tfidf": 0.30563376723316193}, {"document": "Making Games Better for Gamers with Colourblindness & Low Vision | Designing For Disability", "term": "vision", "tfidf": 0.21988250443090948}, {"document": "Making Games Better for Gamers with Colourblindness & Low Vision | Designing For Disability", "term": "game", "tfidf": 0.19839419558567192}, {"document": "Making Games Better for Gamers with Colourblindness & Low Vision | Designing For Disability", "term": "players", "tfidf": 0.19565120629596244}, {"document": "Making Games Better for Gamers with Colourblindness & Low Vision | Designing For Disability", "term": "games", "tfidf": 0.16999192381238906}, {"document": "Making Games Better for Gamers with Colourblindness & Low Vision | Designing For Disability", "term": "colourblindness", "tfidf": 0.1629966688962799}, {"document": "Making Games Better for Gamers with Colourblindness & Low Vision | Designing For Disability", "term": "text", "tfidf": 0.14481415295165967}, {"document": "Making Games Better for Gamers with Colourblindness & Low Vision | Designing For Disability", "term": "option", "tfidf": 0.14371913377540327}, {"document": "Meet Dave | Captain Ahab: The Story of Dave Stieb, Part 1 | Dorktown", "term": "stieb", "tfidf": 0.6671421119934492}, {"document": "Meet Dave | Captain Ahab: The Story of Dave Stieb, Part 1 | Dorktown", "term": "pitcher", "tfidf": 0.2254312098389447}, {"document": "Meet Dave | Captain Ahab: The Story of Dave Stieb, Part 1 | Dorktown", "term": "baseball", "tfidf": 0.21641646962602243}, {"document": "Meet Dave | Captain Ahab: The Story of Dave Stieb, Part 1 | Dorktown", "term": "jays", "tfidf": 0.18937634785137308}, {"document": "Meet Dave | Captain Ahab: The Story of Dave Stieb, Part 1 | Dorktown", "term": "hitter", "tfidf": 0.18031087592202064}, {"document": "Meet Dave | Captain Ahab: The Story of Dave Stieb, Part 1 | Dorktown", "term": "league", "tfidf": 0.18031901796357586}, {"document": "Meet Dave | Captain Ahab: The Story of Dave Stieb, Part 1 | Dorktown", "term": "dave", "tfidf": 0.1623548496320264}, {"document": "Meet Dave | Captain Ahab: The Story of Dave Stieb, Part 1 | Dorktown", "term": "pitchers", "tfidf": 0.117240457310406}, {"document": "Meet Dave | Captain Ahab: The Story of Dave Stieb, Part 1 | Dorktown", "term": "pitching", "tfidf": 0.11720788904930148}, {"document": "Meet Dave | Captain Ahab: The Story of Dave Stieb, Part 1 | Dorktown", "term": "innings", "tfidf": 0.10826850045544587}, {"document": "Nice White Teachers, Bad Brown Schools: Hollywood's Pedagogy on Urban Education", "term": "teachers", "tfidf": 0.38986243036070356}, {"document": "Nice White Teachers, Bad Brown Schools: Hollywood's Pedagogy on Urban Education", "term": "students", "tfidf": 0.3151654910456942}, {"document": "Nice White Teachers, Bad Brown Schools: Hollywood's Pedagogy on Urban Education", "term": "white", "tfidf": 0.27619784529799657}, {"document": "Nice White Teachers, Bad Brown Schools: Hollywood's Pedagogy on Urban Education", "term": "teacher", "tfidf": 0.2612487788129811}, {"document": "Nice White Teachers, Bad Brown Schools: Hollywood's Pedagogy on Urban Education", "term": "school", "tfidf": 0.21483672241393859}, {"document": "Nice White Teachers, Bad Brown Schools: Hollywood's Pedagogy on Urban Education", "term": "schools", "tfidf": 0.19988679857377734}, {"document": "Nice White Teachers, Bad Brown Schools: Hollywood's Pedagogy on Urban Education", "term": "black", "tfidf": 0.1869589679628854}, {"document": "Nice White Teachers, Bad Brown Schools: Hollywood's Pedagogy on Urban Education", "term": "teaching", "tfidf": 0.16861785295041354}, {"document": "Nice White Teachers, Bad Brown Schools: Hollywood's Pedagogy on Urban Education", "term": "johnson", "tfidf": 0.1581175828434269}, {"document": "Nice White Teachers, Bad Brown Schools: Hollywood's Pedagogy on Urban Education", "term": "education", "tfidf": 0.15314936161118775}, {"document": "Nostalghia Critique", "term": "clips", "tfidf": 0.3058115350659078}, {"document": "Nostalghia Critique", "term": "nostalgia", "tfidf": 0.2517041153901664}, {"document": "Nostalghia Critique", "term": "youtube", "tfidf": 0.21520874704602147}, {"document": "Nostalghia Critique", "term": "id", "tfidf": 0.1828213238859616}, {"document": "Nostalghia Critique", "term": "captured", "tfidf": 0.15288367547908388}, {"document": "Nostalghia Critique", "term": "draper", "tfidf": 0.15287409015374964}, {"document": "Nostalghia Critique", "term": "photographs", "tfidf": 0.1528899138456523}, {"document": "Nostalghia Critique", "term": "unedited", "tfidf": 0.15294160694407358}, {"document": "Nostalghia Critique", "term": "wound", "tfidf": 0.15288342405937222}, {"document": "Nostalghia Critique", "term": "footage", "tfidf": 0.13868185062476768}, {"document": "On Leftist Disunity", "term": "left", "tfidf": 0.30248179296197203}, {"document": "On Leftist Disunity", "term": "revolution", "tfidf": 0.22996198785496572}, {"document": "On Leftist Disunity", "term": "incompatible", "tfidf": 0.200125974028912}, {"document": "On Leftist Disunity", "term": "leftism", "tfidf": 0.20015638343894818}, {"document": "On Leftist Disunity", "term": "coalition", "tfidf": 0.16675603396202524}, {"document": "On Leftist Disunity", "term": "anarchists", "tfidf": 0.15329947836379984}, {"document": "On Leftist Disunity", "term": "anti", "tfidf": 0.15107619244949966}, {"document": "On Leftist Disunity", "term": "internationale", "tfidf": 0.1333921138890769}, {"document": "On Leftist Disunity", "term": "socialists", "tfidf": 0.13342592893983451}, {"document": "On Leftist Disunity", "term": "don", "tfidf": 0.12677807780899564}, {"document": "On Writing: Mental Illness in Video Games | a video essay", "term": "player", "tfidf": 0.3573750998146473}, {"document": "On Writing: Mental Illness in Video Games | a video essay", "term": "game", "tfidf": 0.29665151290200303}, {"document": "On Writing: Mental Illness in Video Games | a video essay", "term": "agency", "tfidf": 0.24333997373732194}, {"document": "On Writing: Mental Illness in Video Games | a video essay", "term": "mental", "tfidf": 0.23988669377328373}, {"document": "On Writing: Mental Illness in Video Games | a video essay", "term": "games", "tfidf": 0.20628331279915546}, {"document": "On Writing: Mental Illness in Video Games | a video essay", "term": "illness", "tfidf": 0.2045919029993973}, {"document": "On Writing: Mental Illness in Video Games | a video essay", "term": "suicide", "tfidf": 0.14863924260833256}, {"document": "On Writing: Mental Illness in Video Games | a video essay", "term": "mechanics", "tfidf": 0.13917596148423142}, {"document": "On Writing: Mental Illness in Video Games | a video essay", "term": "like", "tfidf": 0.13764779074806177}, {"document": "On Writing: Mental Illness in Video Games | a video essay", "term": "mechanic", "tfidf": 0.12379912272012569}, {"document": "Parking lots are everywhere and nowhere", "term": "car", "tfidf": 0.33965153995371417}, {"document": "Parking lots are everywhere and nowhere", "term": "parking", "tfidf": 0.2628533077927648}, {"document": "Parking lots are everywhere and nowhere", "term": "park", "tfidf": 0.2013653431607378}, {"document": "Parking lots are everywhere and nowhere", "term": "ambient", "tfidf": 0.16433238361765296}, {"document": "Parking lots are everywhere and nowhere", "term": "liminal", "tfidf": 0.16433152290262848}, {"document": "Parking lots are everywhere and nowhere", "term": "taxi", "tfidf": 0.16232508418994232}, {"document": "Parking lots are everywhere and nowhere", "term": "spaces", "tfidf": 0.161917635721737}, {"document": "Parking lots are everywhere and nowhere", "term": "places", "tfidf": 0.1486372766199533}, {"document": "Parking lots are everywhere and nowhere", "term": "lu", "tfidf": 0.14726059266301011}, {"document": "Parking lots are everywhere and nowhere", "term": "space", "tfidf": 0.14427622972537718}, {"document": "The Anatomy of Stan Culture", "term": "celebrity", "tfidf": 0.5393517832698512}, {"document": "The Anatomy of Stan Culture", "term": "celebrities", "tfidf": 0.44373047928260334}, {"document": "The Anatomy of Stan Culture", "term": "worship", "tfidf": 0.20309704860287175}, {"document": "The Anatomy of Stan Culture", "term": "gossip", "tfidf": 0.19384903536613077}, {"document": "The Anatomy of Stan Culture", "term": "people", "tfidf": 0.14037687235183421}, {"document": "The Anatomy of Stan Culture", "term": "fame", "tfidf": 0.09485027193069522}, {"document": "The Anatomy of Stan Culture", "term": "stan", "tfidf": 0.09481719414567802}, {"document": "The Anatomy of Stan Culture", "term": "behavior", "tfidf": 0.09116337609220347}, {"document": "The Anatomy of Stan Culture", "term": "industry", "tfidf": 0.09109448820013816}, {"document": "The Anatomy of Stan Culture", "term": "production", "tfidf": 0.08691726720854252}, {"document": "The Black Right Wing || Anansi\u2019s Library", "term": "black", "tfidf": 0.3422873944728518}, {"document": "The Black Right Wing || Anansi\u2019s Library", "term": "racist", "tfidf": 0.24121001310489149}, {"document": "The Black Right Wing || Anansi\u2019s Library", "term": "candace", "tfidf": 0.2375733862416169}, {"document": "The Black Right Wing || Anansi\u2019s Library", "term": "owens", "tfidf": 0.23757037621173005}, {"document": "The Black Right Wing || Anansi\u2019s Library", "term": "people", "tfidf": 0.2317520268314264}, {"document": "The Black Right Wing || Anansi\u2019s Library", "term": "racism", "tfidf": 0.17253747597007352}, {"document": "The Black Right Wing || Anansi\u2019s Library", "term": "blm", "tfidf": 0.16969701588422323}, {"document": "The Black Right Wing || Anansi\u2019s Library", "term": "party", "tfidf": 0.16726997247525754}, {"document": "The Black Right Wing || Anansi\u2019s Library", "term": "figures", "tfidf": 0.16162156438973513}, {"document": "The Black Right Wing || Anansi\u2019s Library", "term": "democratic", "tfidf": 0.15211303992280797}, {"document": "The Day Rue \"Became\" Black", "term": "rue", "tfidf": 0.44536905808122973}, {"document": "The Day Rue \"Became\" Black", "term": "black", "tfidf": 0.2909952902400769}, {"document": "The Day Rue \"Became\" Black", "term": "casting", "tfidf": 0.24168670212629303}, {"document": "The Day Rue \"Became\" Black", "term": "white", "tfidf": 0.21748767827622964}, {"document": "The Day Rue \"Became\" Black", "term": "thresh", "tfidf": 0.17580363080607644}, {"document": "The Day Rue \"Became\" Black", "term": "skin", "tfidf": 0.16575436993970943}, {"document": "The Day Rue \"Became\" Black", "term": "cast", "tfidf": 0.13498374982602887}, {"document": "The Day Rue \"Became\" Black", "term": "characters", "tfidf": 0.13201379214586775}, {"document": "The Day Rue \"Became\" Black", "term": "katniss", "tfidf": 0.1289648446332055}, {"document": "The Day Rue \"Became\" Black", "term": "peeta", "tfidf": 0.12897898740807995}, {"document": "The Hobbit: A Long-Expected Autopsy (Part 1/2)", "term": "hobbit", "tfidf": 0.5432801695790311}, {"document": "The Hobbit: A Long-Expected Autopsy (Part 1/2)", "term": "rings", "tfidf": 0.32163930180523914}, {"document": "The Hobbit: A Long-Expected Autopsy (Part 1/2)", "term": "lord", "tfidf": 0.27380698972989564}, {"document": "The Hobbit: A Long-Expected Autopsy (Part 1/2)", "term": "bilbo", "tfidf": 0.2716359230579334}, {"document": "The Hobbit: A Long-Expected Autopsy (Part 1/2)", "term": "tolkien", "tfidf": 0.17108200254679026}, {"document": "The Hobbit: A Long-Expected Autopsy (Part 1/2)", "term": "gandalf", "tfidf": 0.160954189006954}, {"document": "The Hobbit: A Long-Expected Autopsy (Part 1/2)", "term": "scene", "tfidf": 0.12613842618906232}, {"document": "The Hobbit: A Long-Expected Autopsy (Part 1/2)", "term": "sauron", "tfidf": 0.12080752679177736}, {"document": "The Hobbit: A Long-Expected Autopsy (Part 1/2)", "term": "smaug", "tfidf": 0.12081304873489214}, {"document": "The Hobbit: A Long-Expected Autopsy (Part 1/2)", "term": "dwarves", "tfidf": 0.11724947351335992}, {"document": "The Market of Humiliating Black Women", "term": "black", "tfidf": 0.32597035763512117}, {"document": "The Market of Humiliating Black Women", "term": "like", "tfidf": 0.2503871152954519}, {"document": "The Market of Humiliating Black Women", "term": "women", "tfidf": 0.22940755259603965}, {"document": "The Market of Humiliating Black Women", "term": "shit", "tfidf": 0.17646701219191957}, {"document": "The Market of Humiliating Black Women", "term": "just", "tfidf": 0.16533232221156927}, {"document": "The Market of Humiliating Black Women", "term": "know", "tfidf": 0.14527353243995006}, {"document": "The Market of Humiliating Black Women", "term": "vine", "tfidf": 0.12578372740872862}, {"document": "The Market of Humiliating Black Women", "term": "wigs", "tfidf": 0.11462661677493018}, {"document": "The Market of Humiliating Black Women", "term": "jokes", "tfidf": 0.1125864908194519}, {"document": "The Market of Humiliating Black Women", "term": "don", "tfidf": 0.1116363371392608}, {"document": "The Satirical Resurgence of Reefer Madness", "term": "transcript", "tfidf": 1.0000399055458276}, {"document": "The Satirical Resurgence of Reefer Madness", "term": "000", "tfidf": 3.3079390573940106e-05}, {"document": "The Satirical Resurgence of Reefer Madness", "term": "0s", "tfidf": 9.111688981241266e-05}, {"document": "The Satirical Resurgence of Reefer Madness", "term": "10", "tfidf": 3.641791561328013e-05}, {"document": "The Satirical Resurgence of Reefer Madness", "term": "100", "tfidf": 8.334519365624112e-05}, {"document": "The Satirical Resurgence of Reefer Madness", "term": "100k", "tfidf": 2.5587884327552603e-05}, {"document": "The Satirical Resurgence of Reefer Madness", "term": "109", "tfidf": 9.810602767480148e-06}, {"document": "The Satirical Resurgence of Reefer Madness", "term": "10gs", "tfidf": 8.990091876684748e-05}, {"document": "The Satirical Resurgence of Reefer Madness", "term": "10th", "tfidf": 9.490117132082621e-05}, {"document": "The Satirical Resurgence of Reefer Madness", "term": "11", "tfidf": 6.587475435629393e-05}, {"document": "The Strange Reality of Roller Coaster Tycoon", "term": "coaster", "tfidf": 0.6356786837906282}, {"document": "The Strange Reality of Roller Coaster Tycoon", "term": "roller", "tfidf": 0.3125758021895834}, {"document": "The Strange Reality of Roller Coaster Tycoon", "term": "tycoon", "tfidf": 0.2050622283758096}, {"document": "The Strange Reality of Roller Coaster Tycoon", "term": "urbonas", "tfidf": 0.16405240060521814}, {"document": "The Strange Reality of Roller Coaster Tycoon", "term": "ride", "tfidf": 0.16236384822597855}, {"document": "The Strange Reality of Roller Coaster Tycoon", "term": "design", "tfidf": 0.1505821473342486}, {"document": "The Strange Reality of Roller Coaster Tycoon", "term": "game", "tfidf": 0.12394772329930244}, {"document": "The Strange Reality of Roller Coaster Tycoon", "term": "euthanasia", "tfidf": 0.12312093221225545}, {"document": "The Strange Reality of Roller Coaster Tycoon", "term": "coasters", "tfidf": 0.1025552760767215}, {"document": "The Strange Reality of Roller Coaster Tycoon", "term": "rides", "tfidf": 0.10256578411944987}, {"document": "The reign of the Slim-Thick Influencer | Khadija Mbowe", "term": "body", "tfidf": 0.37612443242411897}, {"document": "The reign of the Slim-Thick Influencer | Khadija Mbowe", "term": "bbl", "tfidf": 0.352423091150522}, {"document": "The reign of the Slim-Thick Influencer | Khadija Mbowe", "term": "slim", "tfidf": 0.2707011832342746}, {"document": "The reign of the Slim-Thick Influencer | Khadija Mbowe", "term": "like", "tfidf": 0.20329684463635317}, {"document": "The reign of the Slim-Thick Influencer | Khadija Mbowe", "term": "surgery", "tfidf": 0.20303416180107997}, {"document": "The reign of the Slim-Thick Influencer | Khadija Mbowe", "term": "butt", "tfidf": 0.1895696366083958}, {"document": "The reign of the Slim-Thick Influencer | Khadija Mbowe", "term": "booty", "tfidf": 0.17622720274143402}, {"document": "The reign of the Slim-Thick Influencer | Khadija Mbowe", "term": "plastic", "tfidf": 0.16849128493140325}, {"document": "The reign of the Slim-Thick Influencer | Khadija Mbowe", "term": "procedure", "tfidf": 0.15271661186149998}, {"document": "The reign of the Slim-Thick Influencer | Khadija Mbowe", "term": "bodies", "tfidf": 0.13523095503326346}, {"document": "What Is *Good* Queer Representation in 2020?", "term": "queer", "tfidf": 0.5375753742632879}, {"document": "What Is *Good* Queer Representation in 2020?", "term": "representation", "tfidf": 0.24773190121177124}, {"document": "What Is *Good* Queer Representation in 2020?", "term": "fandom", "tfidf": 0.1740926929641994}, {"document": "What Is *Good* Queer Representation in 2020?", "term": "relationships", "tfidf": 0.15749042946758032}, {"document": "What Is *Good* Queer Representation in 2020?", "term": "couples", "tfidf": 0.1420540697106072}, {"document": "What Is *Good* Queer Representation in 2020?", "term": "queerness", "tfidf": 0.14206641136388137}, {"document": "What Is *Good* Queer Representation in 2020?", "term": "like", "tfidf": 0.126676188808104}, {"document": "What Is *Good* Queer Representation in 2020?", "term": "people", "tfidf": 0.11315565952977398}, {"document": "What Is *Good* Queer Representation in 2020?", "term": "characters", "tfidf": 0.1066137257724106}, {"document": "What Is *Good* Queer Representation in 2020?", "term": "relationship", "tfidf": 0.10601583281073791}, {"document": "Whisper of the Heart: How Does It Feel to Be an Artist | Video Essay", "term": "shizuku", "tfidf": 0.3156533655224175}, {"document": "Whisper of the Heart: How Does It Feel to Be an Artist | Video Essay", "term": "talent", "tfidf": 0.2385336653244446}, {"document": "Whisper of the Heart: How Does It Feel to Be an Artist | Video Essay", "term": "film", "tfidf": 0.23831869228286992}, {"document": "Whisper of the Heart: How Does It Feel to Be an Artist | Video Essay", "term": "artist", "tfidf": 0.23770855128590196}, {"document": "Whisper of the Heart: How Does It Feel to Be an Artist | Video Essay", "term": "whisper", "tfidf": 0.18861715618090852}, {"document": "Whisper of the Heart: How Does It Feel to Be an Artist | Video Essay", "term": "artists", "tfidf": 0.17667575533499422}, {"document": "Whisper of the Heart: How Does It Feel to Be an Artist | Video Essay", "term": "passion", "tfidf": 0.14026236141383056}, {"document": "Whisper of the Heart: How Does It Feel to Be an Artist | Video Essay", "term": "art", "tfidf": 0.13861359590440359}, {"document": "Whisper of the Heart: How Does It Feel to Be an Artist | Video Essay", "term": "miyazaki", "tfidf": 0.13440492613796878}, {"document": "Whisper of the Heart: How Does It Feel to Be an Artist | Video Essay", "term": "doubt", "tfidf": 0.12961700893424874}, {"document": "Why Anime is for Black People - Hip Hop x Anime | Beyond the Bot", "term": "anime", "tfidf": 0.5248809999657416}, {"document": "Why Anime is for Black People - Hip Hop x Anime | Beyond the Bot", "term": "hip", "tfidf": 0.2030036697339187}, {"document": "Why Anime is for Black People - Hip Hop x Anime | Beyond the Bot", "term": "hop", "tfidf": 0.20292599871631625}, {"document": "Why Anime is for Black People - Hip Hop x Anime | Beyond the Bot", "term": "swim", "tfidf": 0.17419473319059034}, {"document": "Why Anime is for Black People - Hip Hop x Anime | Beyond the Bot", "term": "toonami", "tfidf": 0.15895657459865023}, {"document": "Why Anime is for Black People - Hip Hop x Anime | Beyond the Bot", "term": "music", "tfidf": 0.1330278692392758}, {"document": "Why Anime is for Black People - Hip Hop x Anime | Beyond the Bot", "term": "black", "tfidf": 0.13020028712126}, {"document": "Why Anime is for Black People - Hip Hop x Anime | Beyond the Bot", "term": "adult", "tfidf": 0.12489744161220735}, {"document": "Why Anime is for Black People - Hip Hop x Anime | Beyond the Bot", "term": "network", "tfidf": 0.10832317363054428}, {"document": "Why Anime is for Black People - Hip Hop x Anime | Beyond the Bot", "term": "lupe", "tfidf": 0.1060382474882392}, {"document": "Why Panzer Dragoon Saga is the Greatest RPG Nobody Played", "term": "dragoon", "tfidf": 0.5159215159578213}, {"document": "Why Panzer Dragoon Saga is the Greatest RPG Nobody Played", "term": "panzer", "tfidf": 0.5159414481214583}, {"document": "Why Panzer Dragoon Saga is the Greatest RPG Nobody Played", "term": "saga", "tfidf": 0.38701241368345707}, {"document": "Why Panzer Dragoon Saga is the Greatest RPG Nobody Played", "term": "saturn", "tfidf": 0.21772183424552896}, {"document": "Why Panzer Dragoon Saga is the Greatest RPG Nobody Played", "term": "sega", "tfidf": 0.20155064064821462}, {"document": "Why Panzer Dragoon Saga is the Greatest RPG Nobody Played", "term": "game", "tfidf": 0.14346817343959692}, {"document": "Why Panzer Dragoon Saga is the Greatest RPG Nobody Played", "term": "console", "tfidf": 0.09399613731680595}, {"document": "Why Panzer Dragoon Saga is the Greatest RPG Nobody Played", "term": "andromeda", "tfidf": 0.08868952565720548}, {"document": "Why Panzer Dragoon Saga is the Greatest RPG Nobody Played", "term": "rpg", "tfidf": 0.08673245400959095}, {"document": "Why Panzer Dragoon Saga is the Greatest RPG Nobody Played", "term": "dragon", "tfidf": 0.07540906478355854}, {"document": "Your Island is a Commune pt. 1 | Nowhere Grotesk", "term": "village", "tfidf": 0.43369820579211216}, {"document": "Your Island is a Commune pt. 1 | Nowhere Grotesk", "term": "furusato", "tfidf": 0.4205849494811477}, {"document": "Your Island is a Commune pt. 1 | Nowhere Grotesk", "term": "japanese", "tfidf": 0.25539648506977936}, {"document": "Your Island is a Commune pt. 1 | Nowhere Grotesk", "term": "crossing", "tfidf": 0.24973526206572538}, {"document": "Your Island is a Commune pt. 1 | Nowhere Grotesk", "term": "animal", "tfidf": 0.21142960142245365}, {"document": "Your Island is a Commune pt. 1 | Nowhere Grotesk", "term": "japan", "tfidf": 0.16093684820301793}, {"document": "Your Island is a Commune pt. 1 | Nowhere Grotesk", "term": "game", "tfidf": 0.1411524394355171}, {"document": "Your Island is a Commune pt. 1 | Nowhere Grotesk", "term": "community", "tfidf": 0.1372199648626225}, {"document": "Your Island is a Commune pt. 1 | Nowhere Grotesk", "term": "villages", "tfidf": 0.1314106728993473}, {"document": "Your Island is a Commune pt. 1 | Nowhere Grotesk", "term": "anarchism", "tfidf": 0.1296723133045874}, {"document": "make more characters bi, you cowards: why (not) romance?", "term": "bi", "tfidf": 0.7219818286962907}, {"document": "make more characters bi, you cowards: why (not) romance?", "term": "bisexual", "tfidf": 0.21010868254633067}, {"document": "make more characters bi, you cowards: why (not) romance?", "term": "characters", "tfidf": 0.18894189270942494}, {"document": "make more characters bi, you cowards: why (not) romance?", "term": "men", "tfidf": 0.15651333037267962}, {"document": "make more characters bi, you cowards: why (not) romance?", "term": "masculinity", "tfidf": 0.14097635901521324}, {"document": "make more characters bi, you cowards: why (not) romance?", "term": "bisexuality", "tfidf": 0.13540881484063821}, {"document": "make more characters bi, you cowards: why (not) romance?", "term": "women", "tfidf": 0.12094737294504113}, {"document": "make more characters bi, you cowards: why (not) romance?", "term": "hedonistic", "tfidf": 0.12082120917145786}, {"document": "make more characters bi, you cowards: why (not) romance?", "term": "loki", "tfidf": 0.10073004454143035}, {"document": "make more characters bi, you cowards: why (not) romance?", "term": "character", "tfidf": 0.09959526523582879}]}}, {"mode": "vega-lite"});
</script>




```python

```


```python

```


```python

```
