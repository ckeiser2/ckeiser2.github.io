---
name: Text Analysis Visualization
tools: [Python, Altair]
image: assets/pngs/viz.png
description: Python project utilizing altair
custom_js:
  - vega.min
  - vega-lite.min
  - vega-embed.min
  - justcharts
---
*Python* *:Altair Python Package*

# Description
This was a project that takes web scraped data that showcases the scripts from multiple youtube video essays. The goal is to produced a striking visualization of the topics discussed the most in these videos. The videos cover a variety of topics including political but also on series like Lord of the Rings. As Youtube videos become a growing portion of content younger audiences consume these types of visualizations serve as as sign of some of the topics the youth and content creators are discussing.


Jupyter Notebook: http://localhost:8888/notebooks/AAA%20IS%20310%20Programming/Video%20Essay%20Project%20(1).ipynb

<vegachart schema-url="{{ site.baseurl }}/assets/json/text_analysis.md" style="width: 100%"></vegachart>

## Button Links
<div class="left">
{% include elements/button.html link="http://localhost:8888/notebooks/AAA%20IS%20310%20Programming/Video%20Essay%20Project%20(1).ipynb" text="Jupyter Notebook" %}
</div>

<div class="right">
{% include elements/button.html link="https://raw.githubusercontent.com/UIUC-iSchool-DataViz/is445_data/main/bfro_reports_fall2022.csv" text="Dataset" %}
</div>