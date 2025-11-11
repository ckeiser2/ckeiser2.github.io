---
name: 🎮 Godot Game [2048 Knight] 🕹️
#permalink: /games/:name/

tools: [C#, Designer, Godot]
image: assets/pngs/godot.png
layout: page
description: C# in Godot Engine, Designed the UI and multiple systems.
custom_js:
  - vega.min
  - vega-lite.min
  - vega-embed.min
  - justcharts
---
## Skills Showcased
*Godot:* *In-Engine Tools* 
*- Languages:C#*


**Description**
Group project using Godot (A game engine that uses C#) where I served as lead designer. Original concept for 2048 Knight was an RPG interpretation of the mobile game 2048 essentially inspired by its grid based desgin. Some of my roles on the team involved designing the UI and multiple systems. As the scope for the project was only a few weeks of the course the scope was incredibly small especially when considering learning an engine in that time. But showcases my role as designer in which I created proof of concepts through desgin documents. Addtionally, implemented the final UI for the game, including the health bar, inventory system and more. Attached below is a link to google drive that shows design documents and process along with a short demo.

<iframe width="560" height="315"
    src="https://www.youtube.com/embed/8eQsWIewl-M"
    frameborder="0"
    allowfullscreen>
</iframe>

### 🛠 Scripts I wrote

As the designer I aided in the completion of our design documents but additionally, with my technical background, implemented a few core systems to aid the developers on the team including the pause/quit menu, item and inventory systems.

---

#### 📁 Godot Scripts

{% assign scripts = "
pause_menu.gd,
player.gd,
PauseMenu.gd,
PauseMenu2.gd,
PauseMenu2.tscn,
inventory.gd,
inventory.tscn,
item.gd,
item.tscn,
slot.gd
" | split: "," %}

{% for script in scripts %}
<details>
  <summary><strong>{{ script | strip }}</strong></summary>

  {% case script | strip %}
  {% when "pause_menu.gd" %}
  ##### Helper functions for Pause Menu
  {% when "player.gd" %}
  ##### Placeholder player character for testing
  {% when "PauseMenu2.gd" %}
  ##### Updated PauseMenu script for LTS Godot version
  {% when "slot.gd" %}
  ##### Updates item slot animations when items are added/removed
  {% endcase %}

  ```gdscript
  {% include_relative ../../assets/godot/scripts/{{ script | strip }} %}
</details> {% endfor %}


  ##### Link to Google Drive w/ Design Docs  
  <div class="left">
  {% include elements/button.html link="https://drive.google.com/drive/folders/1K3kAyzcWXABthIY7s9kPn_uHCcTR0HU6?usp=sharing" text="Google Drive with Design Documents" %}
  </div>

  ##### Link to GitHub Repo / Project Code  
  <div class="right">
  {% include elements/button.html link="https://github.com/LukeAlbarracin/2048-Knight/tree/main" text="GitHub Repo" %}
  </div>
</details>