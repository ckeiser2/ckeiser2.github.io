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
<details>
  <summary><strong>pause_menu.gd</strong></summary>
  ##### Helper functions for Pause Menu

  {% include_relative ../assets/godot/scripts/pause_menu.gd %}

  ##### Place holder player character for testing purposes  
  {% include_relative ../assets/godot/scripts/player.gd %}

  ##### Main PauseMenu testing script 
  {% include_relative ../assets/godot/scripts/PauseMenu.gd %}
 
  ##### Rewritten Pausemenu scripts to accommodate for LTS Godot version  
  {% include_relative ../assets/godot/scripts/PauseMenu2.gd %}
  {% include_relative ../assets/godot/scripts/PauseMenu2.tscn %}


  ##### Inventory and item system scripts  
  {% include_relative ../assets/godot/scripts/inventory.gd %}
  {% include_relative ../assets/godot/scripts/inventory.tscn %}
  {% include_relative ../assets/godot/scripts/item.gd %}
  {% include_relative ../assets/godot/scripts/item.tscn %}


  ##### Updates the item slots animation depending on if an item is placed in it or not 
    {% include_relative ../assets/godot/scripts/slot1.gd %}

  ##### Link to Google Drive w/ Design Docs  
  <div class="left">
  {% include elements/button.html link="https://drive.google.com/drive/folders/1K3kAyzcWXABthIY7s9kPn_uHCcTR0HU6?usp=sharing" text="Google Drive with Design Documents" %}
  </div>

  ##### Link to GitHub Repo / Project Code  
  <div class="right">
  {% include elements/button.html link="https://github.com/LukeAlbarracin/2048-Knight/tree/main" text="GitHub Repo" %}
  </div>
</details>