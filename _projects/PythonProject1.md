---
name: Python Interactive Data Visualization
tools: [Python, ALtair]
image: assets/pngs/graph.png
description: Using Python and packages like Altair, scraped data from the internet to make an interactive visualization
custom_js:
  - vega.min
  - vega-lite.min
  - vega-embed.min
  - justcharts
---


Jupyter Notebook: http://localhost:8888/notebooks/1A%20ckeiser2%20IS%20445/Workbook.ipynb

Source for Dataset:https://raw.githubusercontent.com/UIUC-iSchool-DataViz/is445_data/main/bfro_reports_fall2022.csv

<vegachart schema-url="{{ site.baseurl }}/assets/json/2_hw8.md" style="width: 100%"></vegachart>

<div class="left">
{% include elements/button.html link="http://localhost:8888/notebooks/1A%20ckeiser2%20IS%20445/Workbook.ipynb" text="Jupyter Notebook" %}
</div>

<div class="right">
{% include elements/button.html link="https://raw.githubusercontent.com/UIUC-iSchool-DataViz/is445_data/main/bfro_reports_fall2022.csv" text="Dataset" %}
</div>
