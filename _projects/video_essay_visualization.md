---
name: Text Analysis Visualization
tools: [Python, Altair]
image: assets/pngs/viz.png
description: This was a project that takes web scraped data that showcases the citations from multiple youtube video essays. The goal is to produced a striking visualization of the topics discussed the most in these videos.
custom_js:
  - vega.min
  - vega-lite.min
  - vega-embed.min
  - justcharts
---

Jupyter Notebook: http://localhost:8888/notebooks/1A%20ckeiser2%20IS%20445/Workbook.ipynb

<vegachart schema-url="{{ site.baseurl }}/assets/json/cars.json" style="width: 100%"></vegachart>