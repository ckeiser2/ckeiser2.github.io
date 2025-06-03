---
name: Network Clustering Analysis
tools: [Python, Networkx, Bokeh]
image: assets/pngs/bokeh_plot (7).png
description: Python project utilizing networkx
custom_js:
  - vega.min
  - vega-lite.min
  - vega-embed.min
  - justcharts
---
*Python:Networkx*

# Description
FOr this project I did a text analysis in python using Networkx and Bokeh to make detailed models that show the relationships, factions and importance by occurence of the characters in "A Song of Ice and Fire (Book 1) of Game of Thrones. Below we will go into further detail on the analysis done. This was imported as an html as Ruby and Jekyll took away Bokeh's interactivity features when imported like an altair graph.


## Data Values Explanation 

*Degrees* : Degrees summarize the sum of the edge weights adjacent to the node.

*Modularity* : Modularity is a measure of the structure of networks or graphs which measures the strength of division of a network into modules.

*Eigenvector* : Is the measure of a node's "influence" within a network

{% include network.html %}



