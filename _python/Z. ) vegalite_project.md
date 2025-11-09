---
name: 📊 Vega Lite Project 🐍
permalink: /python/
layout: page
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

# Python - Packages: Vega-lite

Interactive data visualization that showcases web pulled data of different car brands and their horsepower compared to their miles per gallon. The interactive component stems from being able to hover each circle to see a more detailed view of which car brand, horsepower, and miles per gallon in a window. As we can see many American cars on average have more horsepower but far worse miles per gallon compared to their Europe and Japan counterparts. Depending on the user of this data they may make their decision on a car based on their priorities by saving money with high miles per gallon or the utiliy of horsepower.


<vegachart schema-url="{{ site.baseurl }}/assets/json/cars.json" style="width: 100%"></vegachart>


```python
from vega_datasets import data as datasets

source = datasets.cars()
source.rename(columns={"Miles_per_Gallon":"Miles per Gallon"}, inplace=True)
type(source)
import altair as alt

chart = alt.Chart(source).mark_circle(size=60).encode(
    x='Horsepower',
    y='Miles per Gallon',
    color='Origin',
    tooltip=['Name', 'Origin', 'Horsepower', 'Miles per Gallon']
).interactive()
chart

```
