---
name: Python Interactive Data Visualization
tools: [Python, ALtair]
image: assets/pngs/graph.png
description: Using Python and packages like Altair | Data Analytics | Data Visualization
custom_js:
  - vega.min
  - vega-lite.min
  - vega-embed.min
  - justcharts
---

*Python:Altair*

# Description

Using Python and packages like Altair, scraped data from the internet to make an interactive visualization. Showcases data pulled as of May 2023 of rainfall amongst the 50 states and for more details you can click and drag to get dynamic loading on the right graph. Works best on Windows desktop.


# Dataset Link
Source for Dataset:  *https://raw.githubusercontent.com/UIUC-iSchool-DataViz/is445_data/main/bfro_reports_fall2022.csv*

<div style="display: flex; justify-content: left;">
  <vegachart schema-url="{{ site.baseurl }}/assets/json/2_hw8.md" style="width: 50%;"></vegachart>
</div>

## Jupyter Notebook 

<iframe src="{{ site.baseurl }}/assets/jp_nbs/workbook.html"
        width="100%"
        height="800px"
        frameborder="0"
        style="border: 1px solid #ccc; border-radius: 8px;">
</iframe>

## Button Links
<div class="left">
{% include elements/button.html link="http://localhost:8888/notebooks/1A%20ckeiser2%20IS%20445/Workbook.ipynb" text="Jupyter Notebook" %}
</div>

<div class="right">
{% include elements/button.html link="https://raw.githubusercontent.com/UIUC-iSchool-DataViz/is445_data/main/bfro_reports_fall2022.csv" text="Dataset" %}
</div>
