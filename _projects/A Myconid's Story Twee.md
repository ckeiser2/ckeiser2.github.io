---
name: Twine - DND short story "A Myconid's Story"
tools: [Twine, HTML, CSS]
image: assets/pngs/html_story.png
description: Creative writing DND-esque story with multiple endings written in HTML and CSS along with the Twine engines own language to hold onto and remember variables. Showcases a choose your own adventure story with questionable writing but cool mechanics for being text based. Decisions matter and even programmed a stats system in one of the storylines. Clicking on page will send you to an itch.io page where you can enjoy the html or Twine's own language "Twee" version.
custom_js:
  - vega.min
  - vega-lite.min
  - vega-embed.min
  - justcharts
---


<vegachart schema-url="{{ site.baseurl }}/assets/pngs/html_story.png" style="width: 100%"></vegachart>

<div class="left">
{% include elements/button.html link="https://ckyzer2.itch.io/a-myconids-story" text="HTML Download" %}
</div>

<div class="right">
{% include elements/button.html link="https://blog.4dcu.be/programming/2021/05/03/Interactive-Visualizations.html" text="Twee File" %}
</div>

