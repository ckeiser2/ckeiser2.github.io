---
name: 🎮 RPGMaker game 🕹️
#permalink: /games/:name/

tools: [RPGMaker, Javascript Plugin]
image: assets/pngs/rpg_game.png
layout: page
description: Short developer project utilizing javascript
custom_js:
  - vega.min
  - vega-lite.min
  - vega-embed.min
  - justcharts
---
## 🎮 RPG Maker Project – Custom Javascript Plugins

Short project for a class. Utilziing the RPGmaker engine, created a small demo with a variety of hard coded creature encounters and cutscenes. Attached is a recording of me breaking down how the encounters, abilities, and levels through a mediaspace video. Showcases core engineering concepts like end user appeal, technical knowledge and user first design. Below is a button that takes you to a mediaspace video of me breaking down my design decisions. I would embed the video but github doesn't allow videos of a certain size and I'm in the process of remediating that. 

Something I wanted to play around with in this demo was programming cutscenes, character interactions set by triggers from the player. Unique character designs that scale in fun ways. For example I have a marksman character that has an ability called "Luck of the Draw" that scales off their Luck stat. Additionally, different kinds of characters that are unqiue takes on common design archetypes such as Tanks built around bolstering a teammate like my Blacksmith character or more of a typical paladin design.


### 🛠 Key Plugins Used
This RPG system was expanded using custom-written Javascript plugins to add modern RPG mechanics.

```markdown
📁 **Plugin Files**

- [AltMenuScreen.js]( {{ site.baseurl }}/assets/js/AltMenuScreen.js )


```

## Embedded video of my demo with commentary

<iframe width="560" height="315"
    src="https://www.youtube.com/embed/LX-gkUDabX0"
    frameborder="0"
    allowfullscreen>
</iframe>
