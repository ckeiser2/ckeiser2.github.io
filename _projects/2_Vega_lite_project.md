---
name: Homework 8
tools: [Python, HTML, vega-lite]
image: assets/pngs/cars.png
description: Submission for HW8 showcasing Humidity and Precipitation Chance!
custom_js:
  - vega.min
  - vega-lite.min
  - vega-embed.min
  - justcharts
---


Markdown For this project I used the same dataset from HW7. But instead of tracking temperature highs, I am using other fields of the data set like humidity levels across states and preciptation. I chose this default color scheme because I believe for this data being presented monochromatic was the best choice as to me personally these colors schemes always have the most visual clarity. 

Choosing the fields precipitation chance and humidity levels was interesting because I wanted to see if there was correlation between the two across the states. Allowing the user to select levels of humidity and have that show a more clear selection of the precipitation levels was my form of interactivity which really helps the user see correlations in the data.

```
<vegachart schema-url="{{ site.baseurl }}/assets/json/2_hw8.md" style="width: 100%"></vegachart>
```

<vegachart schema-url="{{ site.baseurl }}/assets/json/2_hw8.md" style="width: 100%"></vegachart>




Jupyter Notebook: http://localhost:8888/notebooks/1A%20ckeiser2%20IS%20445/Workbook.ipynb

Source for Dataset:https://raw.githubusercontent.com/UIUC-iSchool-DataViz/is445_data/main/bfro_reports_fall2022.csv



