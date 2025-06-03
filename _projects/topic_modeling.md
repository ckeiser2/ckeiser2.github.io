---
name: Topic Modeling
tools: [Python, Gensim, MatPlotLib]
image: assets/pngs/table.png
description: Topic Modeling with Python
custom_js:
  - vega.min
  - vega-lite.min
  - vega-embed.min
  - justcharts
---

*Best Viewing Experience on this page in Light Mode*

One of the primary applications of natural language processing is to automatically extract what topics people are discussing from large volumes of text. We need an automated algorithm that can read through the text documents and automatically output the topics discussed. In this lab, we will use Latent Dirichlet Allocation(LDA), a popular algorithm for topic modeling. LDA is a Bayesian network that explains a set of observations through unobserved groups, and each group explains why some parts of the data are similar.

{% include topic_modeling.html %}
