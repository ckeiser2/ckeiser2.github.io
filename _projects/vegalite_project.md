---
name: Vega Lite Project
tools: [Python, HTML, vega-lite]
image: assets/pngs/cars.png
description: This is a project that uses vega-lite for interactive data visualization
custom_js:
  - vega.min
  - vega-lite.min
  - vega-embed.min
  - justcharts
---
*Python* *:Vega-Lite*

# Python: Vega-lite

Comes from this [great blog post right here](https://blog.4dcu.be/programming/2021/05/03/Interactive-Visualizations.html) that was also used in [our test import script](https://github.com/UIUC-iSchool-DataViz/is445_bcubcg_fall2022/blob/main/week01/test_imports_week01.ipynb).



<vegachart schema-url="{{ site.baseurl }}/assets/json/cars.json" style="width: 100%"></vegachart>

