---
name: Network Clustering Analysis
tools: [Python, Networkx]
image: assets/pngs/output_2.png
description: Python project utilizing networkx
custom_js:
  - vega.min
  - vega-lite.min
  - vega-embed.min
  - justcharts
---
*Python* *:Altair Python Package*

# Description
Placeholder text

## Button Links
**This version will have working interactive graphs!!**
<div class="left">
<vegachart schema-url="{{ site.baseurl }}/assets/html/Network Analysis II-Solutions.html" style="width: 100%"></vegachart>

{% include elements/button.html link="{{ site.baseurl }}assets/html/Network Analysis II-Solutions.html" text="Jupyter Notebook Version" %}
</div>

# Network Clustering


```python
# Load the libraries
import pandas as pd
import networkx
import matplotlib.pyplot as plt
import numpy as np
```


```python
# Load the data of the network of the first book of A Song of Ice and Fire
asoiaf_df = pd.read_csv('Data/asoiaf-book1-edges.csv')
asoiaf_df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Source</th>
      <th>Target</th>
      <th>Type</th>
      <th>weight</th>
      <th>book</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Addam-Marbrand</td>
      <td>Jaime-Lannister</td>
      <td>Undirected</td>
      <td>3</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Addam-Marbrand</td>
      <td>Tywin-Lannister</td>
      <td>Undirected</td>
      <td>6</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Aegon-I-Targaryen</td>
      <td>Daenerys-Targaryen</td>
      <td>Undirected</td>
      <td>5</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Aegon-I-Targaryen</td>
      <td>Eddard-Stark</td>
      <td>Undirected</td>
      <td>4</td>
      <td>1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Aemon-Targaryen-(Maester-Aemon)</td>
      <td>Alliser-Thorne</td>
      <td>Undirected</td>
      <td>4</td>
      <td>1</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>679</th>
      <td>Tyrion-Lannister</td>
      <td>Willis-Wode</td>
      <td>Undirected</td>
      <td>4</td>
      <td>1</td>
    </tr>
    <tr>
      <th>680</th>
      <td>Tyrion-Lannister</td>
      <td>Yoren</td>
      <td>Undirected</td>
      <td>10</td>
      <td>1</td>
    </tr>
    <tr>
      <th>681</th>
      <td>Tywin-Lannister</td>
      <td>Varys</td>
      <td>Undirected</td>
      <td>4</td>
      <td>1</td>
    </tr>
    <tr>
      <th>682</th>
      <td>Tywin-Lannister</td>
      <td>Walder-Frey</td>
      <td>Undirected</td>
      <td>8</td>
      <td>1</td>
    </tr>
    <tr>
      <th>683</th>
      <td>Waymar-Royce</td>
      <td>Will-(prologue)</td>
      <td>Undirected</td>
      <td>18</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
<p>684 rows × 5 columns</p>
</div>




```python
# Create a Network from a Pandas dataframe
G = networkx.from_pandas_edgelist(asoiaf_df, 'Source', 'Target', 'weight')
G['Jon-Snow']
```




    AtlasView({'Aemon-Targaryen-(Maester-Aemon)': {'weight': 34}, 'Albett': {'weight': 5}, 'Alliser-Thorne': {'weight': 32}, 'Arya-Stark': {'weight': 37}, 'Benjen-Stark': {'weight': 41}, 'Bowen-Marsh': {'weight': 10}, 'Bran-Stark': {'weight': 56}, 'Catelyn-Stark': {'weight': 14}, 'Cersei-Lannister': {'weight': 4}, 'Chett': {'weight': 4}, 'Dareon': {'weight': 6}, 'Donal-Noye': {'weight': 7}, 'Dywen': {'weight': 4}, 'Eddard-Stark': {'weight': 38}, 'Grenn': {'weight': 31}, 'Halder': {'weight': 23}, 'Hobb': {'weight': 5}, 'Jaremy-Rykker': {'weight': 7}, 'Jeor-Mormont': {'weight': 81}, 'Joffrey-Baratheon': {'weight': 10}, 'Jory-Cassel': {'weight': 3}, 'Luwin': {'weight': 10}, 'Matthar': {'weight': 3}, 'Mordane': {'weight': 4}, 'Othor': {'weight': 5}, 'Pypar': {'weight': 45}, 'Rast': {'weight': 8}, 'Rickon-Stark': {'weight': 11}, 'Robb-Stark': {'weight': 53}, 'Robert-Baratheon': {'weight': 18}, 'Rodrik-Cassel': {'weight': 3}, 'Samwell-Tarly': {'weight': 81}, 'Sansa-Stark': {'weight': 8}, 'Theon-Greyjoy': {'weight': 8}, 'Todder': {'weight': 13}, 'Tyrion-Lannister': {'weight': 56}, 'Yoren': {'weight': 6}})




```python
# Calculate the number of triangles each node is in
triangle_dict = networkx.triangles(G)
triangle_dict
```




    {'Addam-Marbrand': 1,
     'Jaime-Lannister': 144,
     'Tywin-Lannister': 77,
     'Aegon-I-Targaryen': 1,
     'Daenerys-Targaryen': 55,
     'Eddard-Stark': 285,
     'Aemon-Targaryen-(Maester-Aemon)': 12,
     'Alliser-Thorne': 26,
     'Bowen-Marsh': 10,
     'Chett': 3,
     'Clydas': 0,
     'Jeor-Mormont': 30,
     'Jon-Snow': 140,
     'Samwell-Tarly': 27,
     'Aerys-II-Targaryen': 10,
     'Brandon-Stark': 7,
     'Gerold-Hightower': 3,
     'Jon-Arryn': 61,
     'Robert-Baratheon': 260,
     'Aggo': 11,
     'Drogo': 48,
     'Jhogo': 12,
     'Jorah-Mormont': 37,
     'Quaro': 8,
     'Rakharo': 8,
     'Albett': 3,
     'Halder': 19,
     'Rast': 12,
     'Grenn': 16,
     'Pypar': 17,
     'Tyrion-Lannister': 187,
     'Alyn': 7,
     'Harwin': 4,
     'Jory-Cassel': 82,
     'Tomard': 13,
     'Arthur-Dayne': 0,
     'Arya-Stark': 126,
     'Benjen-Stark': 40,
     'Bran-Stark': 149,
     'Catelyn-Stark': 175,
     'Cersei-Lannister': 179,
     'Desmond': 1,
     'Ilyn-Payne': 28,
     'Jeyne-Poole': 12,
     'Joffrey-Baratheon': 183,
     'Meryn-Trant': 25,
     'Mordane': 42,
     'Mycah': 10,
     'Myrcella-Baratheon': 19,
     'Petyr-Baelish': 155,
     'Rickon-Stark': 33,
     'Robb-Stark': 154,
     'Rodrik-Cassel': 77,
     'Sandor-Clegane': 75,
     'Sansa-Stark': 199,
     'Syrio-Forel': 2,
     'Tommen-Baratheon': 20,
     'Vayon-Poole': 10,
     'Yoren': 18,
     'Arys-Oakheart': 0,
     'Balon-Greyjoy': 1,
     'Balon-Swann': 1,
     'Renly-Baratheon': 91,
     'Barristan-Selmy': 68,
     'Boros-Blount': 10,
     'Pycelle': 67,
     'Varys': 93,
     'Jaremy-Rykker': 3,
     'Luwin': 60,
     'Mance-Rayder': 0,
     'Theon-Greyjoy': 57,
     'Waymar-Royce': 1,
     'Beric-Dondarrion': 10,
     'Gregor-Clegane': 42,
     'Loras-Tyrell': 49,
     'Thoros-of-Myr': 0,
     'Hali': 0,
     'Hallis-Mollen': 10,
     'Hodor': 6,
     'Hullen': 10,
     'Joseth': 1,
     'Nan': 6,
     'Osha': 3,
     'Rickard-Karstark': 23,
     'Rickard-Stark': 0,
     'Stiv': 1,
     'Lyanna-Stark': 5,
     'Bronn': 18,
     'Chiggen': 3,
     'Marillion': 10,
     'Shae': 1,
     'Shagga': 3,
     'Vardis-Egen': 8,
     'Willis-Wode': 12,
     'Brynden-Tully': 29,
     'Edmure-Tully': 23,
     'Hoster-Tully': 8,
     'Lysa-Arryn': 42,
     'Nestor-Royce': 1,
     'Walder-Frey': 11,
     'Colemon': 1,
     'Donnel-Waynwood': 0,
     'Eon-Hunter': 3,
     'Jon-Umber-(Greatjon)': 15,
     'Masha-Heddle': 0,
     'Moreo-Tumitis': 0,
     'Mya-Stone': 0,
     'Mychel-Redfort': 0,
     'Robert-Arryn': 3,
     'Stevron-Frey': 1,
     'Tytos-Blackwood': 1,
     'Wendel-Manderly': 1,
     'Cayn': 2,
     'Janos-Slynt': 21,
     'Stannis-Baratheon': 46,
     'Chella': 0,
     'Clement-Piper': 0,
     'Karyl-Vance': 1,
     'Cohollo': 6,
     'Haggo': 11,
     'Qotho': 14,
     'Conn': 1,
     'Coratt': 0,
     'Doreah': 14,
     'Eroeh': 0,
     'Illyrio-Mopatis': 14,
     'Irri': 21,
     'Jhiqui': 10,
     'Mirri-Maz-Duur': 12,
     'Rhaegar-Targaryen': 12,
     'Viserys-Targaryen': 21,
     'Danwell-Frey': 1,
     'Hosteen-Frey': 1,
     'Jared-Frey': 1,
     'Dareon': 0,
     'Daryn-Hornwood': 1,
     'Torrhen-Karstark': 2,
     'Dolf': 0,
     'Donal-Noye': 0,
     'Jommo': 1,
     'Ogo': 1,
     'Rhaego': 0,
     'Dywen': 0,
     'Galbart-Glover': 11,
     'Gendry': 0,
     'High-Septon-(fat_one)': 1,
     'Howland-Reed': 0,
     'Jacks': 0,
     'Joss': 0,
     'Marq-Piper': 5,
     'Porther': 0,
     'Raymun-Darry': 1,
     'Tobho-Mott': 0,
     'Tregar': 0,
     'Varly': 0,
     'Wyl-(guard)': 4,
     'Wylla': 0,
     'Fogo': 0,
     'Roose-Bolton': 8,
     'Gared': 1,
     'Will-(prologue)': 1,
     'Oswell-Whent': 0,
     'Todder': 6,
     'Gunthor-son-of-Gurn': 0,
     'Harys-Swyft': 0,
     'Heward': 1,
     'Hobb': 0,
     'Hugh': 0,
     'Jafer-Flowers': 0,
     'Kevan-Lannister': 3,
     'Matthar': 0,
     'Othor': 0,
     'Maege-Mormont': 1,
     'Jonos-Bracken': 0,
     'Jyck': 1,
     'Morrec': 1,
     'Kurleket': 0,
     'Lancel-Lannister': 0,
     'Leo-Lefford': 0,
     'Mace-Tyrell': 0,
     'Lyn-Corbray': 0,
     'Paxter-Redwyne': 0,
     'Maegor-I-Targaryen': 0,
     'Mord': 0,
     'Randyll-Tarly': 0,
     'Timett': 1,
     'Ulf-son-of-Umar': 0}




```python
# The clustering of a node is the fraction of possible triangles through that node that exist
clustering_dict = networkx.clustering(G)
clustering_dict
```




    {'Addam-Marbrand': 1.0,
     'Jaime-Lannister': 0.35467980295566504,
     'Tywin-Lannister': 0.3333333333333333,
     'Aegon-I-Targaryen': 1.0,
     'Daenerys-Targaryen': 0.2619047619047619,
     'Eddard-Stark': 0.13286713286713286,
     'Aemon-Targaryen-(Maester-Aemon)': 0.5714285714285714,
     'Alliser-Thorne': 0.5777777777777777,
     'Bowen-Marsh': 1.0,
     'Chett': 1.0,
     'Clydas': 0,
     'Jeor-Mormont': 0.38461538461538464,
     'Jon-Snow': 0.21021021021021022,
     'Samwell-Tarly': 0.4090909090909091,
     'Aerys-II-Targaryen': 0.6666666666666666,
     'Brandon-Stark': 0.4666666666666667,
     'Gerold-Hightower': 0.3,
     'Jon-Arryn': 0.580952380952381,
     'Robert-Baratheon': 0.21224489795918366,
     'Aggo': 0.7333333333333333,
     'Drogo': 0.2807017543859649,
     'Jhogo': 0.8,
     'Jorah-Mormont': 0.47435897435897434,
     'Quaro': 0.8,
     'Rakharo': 0.8,
     'Albett': 1.0,
     'Halder': 0.6785714285714286,
     'Rast': 0.8,
     'Grenn': 0.7619047619047619,
     'Pypar': 0.8095238095238095,
     'Tyrion-Lannister': 0.18067632850241547,
     'Alyn': 0.7,
     'Harwin': 0.6666666666666666,
     'Jory-Cassel': 0.3904761904761905,
     'Tomard': 0.6190476190476191,
     'Arthur-Dayne': 0,
     'Arya-Stark': 0.358974358974359,
     'Benjen-Stark': 0.43956043956043955,
     'Bran-Stark': 0.3004032258064516,
     'Catelyn-Stark': 0.1937984496124031,
     'Cersei-Lannister': 0.4114942528735632,
     'Desmond': 1.0,
     'Ilyn-Payne': 0.7777777777777778,
     'Jeyne-Poole': 0.8,
     'Joffrey-Baratheon': 0.4206896551724138,
     'Meryn-Trant': 0.6944444444444444,
     'Mordane': 0.7636363636363637,
     'Mycah': 1.0,
     'Myrcella-Baratheon': 0.9047619047619048,
     'Petyr-Baelish': 0.47692307692307695,
     'Rickon-Stark': 0.9166666666666666,
     'Robb-Stark': 0.25882352941176473,
     'Rodrik-Cassel': 0.5032679738562091,
     'Sandor-Clegane': 0.625,
     'Sansa-Stark': 0.334453781512605,
     'Syrio-Forel': 0.6666666666666666,
     'Tommen-Baratheon': 0.7142857142857143,
     'Vayon-Poole': 1.0,
     'Yoren': 0.8571428571428571,
     'Arys-Oakheart': 0,
     'Balon-Greyjoy': 1.0,
     'Balon-Swann': 1.0,
     'Renly-Baratheon': 0.5947712418300654,
     'Barristan-Selmy': 0.7472527472527473,
     'Boros-Blount': 1.0,
     'Pycelle': 0.7362637362637363,
     'Varys': 0.6838235294117647,
     'Jaremy-Rykker': 0.5,
     'Luwin': 0.39215686274509803,
     'Mance-Rayder': 0,
     'Theon-Greyjoy': 0.5428571428571428,
     'Waymar-Royce': 0.3333333333333333,
     'Beric-Dondarrion': 0.6666666666666666,
     'Gregor-Clegane': 0.6363636363636364,
     'Loras-Tyrell': 0.5384615384615384,
     'Thoros-of-Myr': 0,
     'Hali': 0,
     'Hallis-Mollen': 1.0,
     'Hodor': 1.0,
     'Hullen': 0.6666666666666666,
     'Joseth': 1.0,
     'Nan': 1.0,
     'Osha': 1.0,
     'Rickard-Karstark': 0.5111111111111111,
     'Rickard-Stark': 0,
     'Stiv': 1.0,
     'Lyanna-Stark': 0.8333333333333334,
     'Bronn': 0.4,
     'Chiggen': 1.0,
     'Marillion': 1.0,
     'Shae': 1.0,
     'Shagga': 0.2,
     'Vardis-Egen': 0.5333333333333333,
     'Willis-Wode': 0.8,
     'Brynden-Tully': 0.5272727272727272,
     'Edmure-Tully': 0.41818181818181815,
     'Hoster-Tully': 0.8,
     'Lysa-Arryn': 0.4,
     'Nestor-Royce': 1.0,
     'Walder-Frey': 0.5238095238095238,
     'Colemon': 1.0,
     'Donnel-Waynwood': 0,
     'Eon-Hunter': 1.0,
     'Jon-Umber-(Greatjon)': 0.5357142857142857,
     'Masha-Heddle': 0,
     'Moreo-Tumitis': 0,
     'Mya-Stone': 0,
     'Mychel-Redfort': 0,
     'Robert-Arryn': 1.0,
     'Stevron-Frey': 1.0,
     'Tytos-Blackwood': 0.3333333333333333,
     'Wendel-Manderly': 1.0,
     'Cayn': 0.6666666666666666,
     'Janos-Slynt': 1.0,
     'Stannis-Baratheon': 0.696969696969697,
     'Chella': 0,
     'Clement-Piper': 0,
     'Karyl-Vance': 0.3333333333333333,
     'Cohollo': 1.0,
     'Haggo': 0.7333333333333333,
     'Qotho': 0.6666666666666666,
     'Conn': 0.3333333333333333,
     'Coratt': 0,
     'Doreah': 0.9333333333333333,
     'Eroeh': 0,
     'Illyrio-Mopatis': 0.9333333333333333,
     'Irri': 0.75,
     'Jhiqui': 1.0,
     'Mirri-Maz-Duur': 0.8,
     'Rhaegar-Targaryen': 0.5714285714285714,
     'Viserys-Targaryen': 0.75,
     'Danwell-Frey': 0.3333333333333333,
     'Hosteen-Frey': 1.0,
     'Jared-Frey': 1.0,
     'Dareon': 0,
     'Daryn-Hornwood': 1.0,
     'Torrhen-Karstark': 0.6666666666666666,
     'Dolf': 0,
     'Donal-Noye': 0,
     'Jommo': 1.0,
     'Ogo': 0.3333333333333333,
     'Rhaego': 0,
     'Dywen': 0,
     'Galbart-Glover': 0.7333333333333333,
     'Gendry': 0,
     'High-Septon-(fat_one)': 1.0,
     'Howland-Reed': 0,
     'Jacks': 0,
     'Joss': 0,
     'Marq-Piper': 0.5,
     'Porther': 0,
     'Raymun-Darry': 1.0,
     'Tobho-Mott': 0,
     'Tregar': 0,
     'Varly': 0,
     'Wyl-(guard)': 0.6666666666666666,
     'Wylla': 0,
     'Fogo': 0,
     'Roose-Bolton': 0.8,
     'Gared': 0.3333333333333333,
     'Will-(prologue)': 1.0,
     'Oswell-Whent': 0,
     'Todder': 1.0,
     'Gunthor-son-of-Gurn': 0,
     'Harys-Swyft': 0,
     'Heward': 1.0,
     'Hobb': 0,
     'Hugh': 0,
     'Jafer-Flowers': 0,
     'Kevan-Lannister': 1.0,
     'Matthar': 0,
     'Othor': 0,
     'Maege-Mormont': 1.0,
     'Jonos-Bracken': 0,
     'Jyck': 1.0,
     'Morrec': 1.0,
     'Kurleket': 0,
     'Lancel-Lannister': 0,
     'Leo-Lefford': 0,
     'Mace-Tyrell': 0,
     'Lyn-Corbray': 0,
     'Paxter-Redwyne': 0,
     'Maegor-I-Targaryen': 0,
     'Mord': 0,
     'Randyll-Tarly': 0,
     'Timett': 1.0,
     'Ulf-son-of-Umar': 0}




```python
# Create a dataframe from the triangle dictionary
triangle_df = pd.DataFrame({'Name': triangle_dict.keys(), 'Triangles': triangle_dict.values()})
triangle_df = triangle_df.sort_values(by='Triangles', ascending=False)
triangle_df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Name</th>
      <th>Triangles</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>5</th>
      <td>Eddard-Stark</td>
      <td>285</td>
    </tr>
    <tr>
      <th>18</th>
      <td>Robert-Baratheon</td>
      <td>260</td>
    </tr>
    <tr>
      <th>54</th>
      <td>Sansa-Stark</td>
      <td>199</td>
    </tr>
    <tr>
      <th>30</th>
      <td>Tyrion-Lannister</td>
      <td>187</td>
    </tr>
    <tr>
      <th>44</th>
      <td>Joffrey-Baratheon</td>
      <td>183</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>152</th>
      <td>Tobho-Mott</td>
      <td>0</td>
    </tr>
    <tr>
      <th>153</th>
      <td>Tregar</td>
      <td>0</td>
    </tr>
    <tr>
      <th>76</th>
      <td>Hali</td>
      <td>0</td>
    </tr>
    <tr>
      <th>156</th>
      <td>Wylla</td>
      <td>0</td>
    </tr>
    <tr>
      <th>186</th>
      <td>Ulf-son-of-Umar</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
<p>187 rows × 2 columns</p>
</div>




```python
# Create a dataframe from the clustering dictionary
clustering_df = pd.DataFrame({'Name': clustering_dict.keys(), 'Clustering': clustering_dict.values()})
clustering_df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Name</th>
      <th>Clustering</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Addam-Marbrand</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Jaime-Lannister</td>
      <td>0.354680</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Tywin-Lannister</td>
      <td>0.333333</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Aegon-I-Targaryen</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Daenerys-Targaryen</td>
      <td>0.261905</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>182</th>
      <td>Maegor-I-Targaryen</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>183</th>
      <td>Mord</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>184</th>
      <td>Randyll-Tarly</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>185</th>
      <td>Timett</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>186</th>
      <td>Ulf-son-of-Umar</td>
      <td>0.000000</td>
    </tr>
  </tbody>
</table>
<p>187 rows × 2 columns</p>
</div>




```python
# Merge the two dataframes
triangle_and_clustering_df = pd.merge(triangle_df, clustering_df, on='Name')
triangle_and_clustering_df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Name</th>
      <th>Triangles</th>
      <th>Clustering</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Eddard-Stark</td>
      <td>285</td>
      <td>0.132867</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Robert-Baratheon</td>
      <td>260</td>
      <td>0.212245</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Sansa-Stark</td>
      <td>199</td>
      <td>0.334454</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Tyrion-Lannister</td>
      <td>187</td>
      <td>0.180676</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Joffrey-Baratheon</td>
      <td>183</td>
      <td>0.420690</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>182</th>
      <td>Tobho-Mott</td>
      <td>0</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>183</th>
      <td>Tregar</td>
      <td>0</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>184</th>
      <td>Hali</td>
      <td>0</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>185</th>
      <td>Wylla</td>
      <td>0</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>186</th>
      <td>Ulf-son-of-Umar</td>
      <td>0</td>
      <td>0.000000</td>
    </tr>
  </tbody>
</table>
<p>187 rows × 3 columns</p>
</div>



# Task 1


```python
# Duplicate the process above to create a dataframe with triangles and clustering for each node in A Song of Ice and Fire Book 3.
# As is the case above, the results should be sorted by number of triangles, in descending order.

asoiaf_b3_df = pd.read_csv('Data/asoiaf-book3-edges.csv')
G_b3 = networkx.from_pandas_edgelist(asoiaf_b3_df, 'Source', 'Target', 'weight')
triangle_b3_dict = networkx.triangles(G_b3)
clustering_b3_dict = networkx.clustering(G_b3)
triangle_b3_df = pd.DataFrame({'Name': triangle_b3_dict.keys(), 'Triangles': triangle_b3_dict.values()})
triangle_b3_df = triangle_b3_df.sort_values(by='Triangles', ascending=False)
clustering_b3_df = pd.DataFrame({'Name': clustering_b3_dict.keys(), 'Clustering': clustering_b3_dict.values()})
clustering_b3_df = clustering_b3_df.sort_values(by='Clustering', ascending=False)
triangle_and_clustering_b3_df = pd.merge(triangle_b3_df, clustering_b3_df, on='Name')
triangle_and_clustering_b3_df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Name</th>
      <th>Triangles</th>
      <th>Clustering</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Tyrion-Lannister</td>
      <td>243</td>
      <td>0.142022</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Joffrey-Baratheon</td>
      <td>236</td>
      <td>0.192653</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Cersei-Lannister</td>
      <td>180</td>
      <td>0.256046</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Sansa-Stark</td>
      <td>177</td>
      <td>0.156915</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Jaime-Lannister</td>
      <td>171</td>
      <td>0.172727</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>298</th>
      <td>Arson</td>
      <td>0</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>299</th>
      <td>Galyeon-of-Cuy</td>
      <td>0</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>300</th>
      <td>Galbart-Glover</td>
      <td>0</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>301</th>
      <td>Mad-Huntsman</td>
      <td>0</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>302</th>
      <td>Tion-Frey</td>
      <td>0</td>
      <td>0.000000</td>
    </tr>
  </tbody>
</table>
<p>303 rows × 3 columns</p>
</div>




```python
# Graph transitivity, the fraction of all possible triangles present in G.
# Possible triangles are identified by the number of "triads" (two edges with a shared node).
networkx.transitivity(G)
```




    0.3302342878393455



# Task 2

Calculate the graph transitivity for the network created based on the data from A Song of Ice and Fire Book 3. Is the graph transitivity higher or lower than the transitivity of the network constructed from A Song of Ice and Fire Book 1? Analyze the significance of this comparison, considering what it may reveal about the narrative development within <i>A Song of Ice and Fire</i>. If you're not familiar with the work, feel free to speculate on potential reasons. To provide context, please refer to the definitions of graph transitivity (included above) to clarify their implications. Include the calculation in the following cell (code) and the discussion in the next cell (markdown).


```python
asoiaf_b3_df = pd.read_csv('Data/asoiaf-book3-edges.csv')
G_b3 = networkx.from_pandas_edgelist(asoiaf_b3_df, 'Source', 'Target', 'weight')
networkx.transitivity(G_b3)
```




    0.27702231520223153





# Basic Network Visualization with Bokeh

<img src="{{ site.baseurl }}/assets/pngs/bokeh_plot (2).png" alt="Basic Network Visualization with Bokeh">

```python
# Changing bokeh version because the latest version will result in bugs in network visualization
!pip install bokeh==2.4.3
```

    Requirement already satisfied: bokeh==2.4.3 in c:\users\colto\anaconda3\lib\site-packages (2.4.3)
    Requirement already satisfied: Jinja2>=2.9 in c:\users\colto\anaconda3\lib\site-packages (from bokeh==2.4.3) (3.1.2)
    Requirement already satisfied: numpy>=1.11.3 in c:\users\colto\anaconda3\lib\site-packages (from bokeh==2.4.3) (1.24.3)
    Requirement already satisfied: packaging>=16.8 in c:\users\colto\anaconda3\lib\site-packages (from bokeh==2.4.3) (23.1)
    Requirement already satisfied: pillow>=7.1.0 in c:\users\colto\anaconda3\lib\site-packages (from bokeh==2.4.3) (9.4.0)
    Requirement already satisfied: PyYAML>=3.10 in c:\users\colto\anaconda3\lib\site-packages (from bokeh==2.4.3) (6.0)
    Requirement already satisfied: tornado>=5.1 in c:\users\colto\anaconda3\lib\site-packages (from bokeh==2.4.3) (6.3.2)
    Requirement already satisfied: typing-extensions>=3.10.0 in c:\users\colto\anaconda3\lib\site-packages (from bokeh==2.4.3) (4.7.1)
    Requirement already satisfied: MarkupSafe>=2.0 in c:\users\colto\anaconda3\lib\site-packages (from Jinja2>=2.9->bokeh==2.4.3) (2.1.1)
    


```python
# Check the bokeh version. It should be 2.4.3.
!pip show bokeh
```

    Name: bokeh
    Version: 2.4.3
    Summary: Interactive plots and applications in the browser from Python
    Home-page: https://github.com/bokeh/bokeh
    Author: Bokeh Team
    Author-email: info@bokeh.org
    License: BSD-3-Clause
    Location: C:\Users\colto\anaconda3\Lib\site-packages
    Requires: Jinja2, numpy, packaging, pillow, PyYAML, tornado, typing-extensions
    Required-by: hvplot, panel
    


```python
# Set up Bokeh to work in Jupyter notebook
from bokeh.io import output_notebook
output_notebook()
```


<div class="bk-root">
        <a href="https://bokeh.org" target="_blank" class="bk-logo bk-logo-small bk-logo-notebook"></a>
        <span id="2180">Loading BokehJS ...</span>
    </div>






```python
# Import necessary Bokeh modules
from bokeh.io import show, save
from bokeh.models import Range1d, Circle, ColumnDataSource, MultiLine
from bokeh.plotting import figure
from bokeh.plotting import from_networkx
```


```python
# Basic visualization

#Choose a title
title = 'A Song of Ice and Fire (Book 1) Network'

#Establish which categories will appear when hovering over each node
HOVER_TOOLTIPS = [("Character", "@index")] # Index is the name of the character

#Create a plot — set dimensions, toolbar, and title
plot = figure(tooltips = HOVER_TOOLTIPS,
              tools="pan,wheel_zoom,save,reset", active_scroll='wheel_zoom',
            x_range=Range1d(-10.1, 10.1), y_range=Range1d(-10.1, 10.1), title=title)

#Create a network graph object with spring layout
#https://networkx.github.io/documentation/networkx-1.9/reference/generated/networkx.drawing.layout.spring_layout.html
network_graph = from_networkx(G, networkx.spring_layout, scale=10, center=(0, 0))

#Set node size and color
network_graph.node_renderer.glyph = Circle(size=15, fill_color='skyblue')

#Set edge opacity and width
network_graph.edge_renderer.glyph = MultiLine(line_alpha=0.5, line_width=1)

#Add network graph to the plot
plot.renderers.append(network_graph)

show(plot)
```



<div class="bk-root" id="1a268e81-5593-43fc-b556-98fbb1d2e6ac" data-root-id="2183"></div>





# Network with Nodes Sized and Colored By Attribute (Degree)

<img src="{{ site.baseurl }}/assets/pngs/bokeh_plot (1).png" alt="Network with Nodes Sized and Colored By Attribute (Degree)">

```python
# Include Bokeh color palettes
from bokeh.palettes import Blues8, Reds8, Purples8, Oranges8, Viridis8, Spectral8
from bokeh.transform import linear_cmap
```


```python
# Calculate degree for each node and add as node attribute
degrees = dict(networkx.degree(G))
networkx.set_node_attributes(G, name='degree', values=degrees)
```


```python
#Choose attributes from G network to size and color by degree (NEW)
size_by_this_attribute = 'degree'
color_by_this_attribute = 'degree'

#Pick a color palette — Blues8, Reds8, Purples8, Oranges8, Viridis8, Spectral8 (NEW)
color_palette = Blues8

#Choose a title
title = 'A Song of Ice and Fire (Book 1) Network'

#Establish which categories will appear when hovering over each node
HOVER_TOOLTIPS = [
       ("Character", "@index"),
        ("Degree", "@degree")
]

#Create a plot — set dimensions, toolbar, and title
plot = figure(tooltips = HOVER_TOOLTIPS,
              tools="pan,wheel_zoom,save,reset", active_scroll='wheel_zoom',
            x_range=Range1d(-10.1, 10.1), y_range=Range1d(-10.1, 10.1), title=title)

#Create a network graph object
network_graph = from_networkx(G, networkx.spring_layout, scale=10, center=(0, 0))

#Set node sizes and colors according to node degree (color as spectrum of color palette) (NEW)
minimum_value_color = min(network_graph.node_renderer.data_source.data[color_by_this_attribute])
maximum_value_color = max(network_graph.node_renderer.data_source.data[color_by_this_attribute])
network_graph.node_renderer.glyph = Circle(size=size_by_this_attribute, fill_color=linear_cmap(color_by_this_attribute, color_palette, minimum_value_color, maximum_value_color))

#Set edge opacity and width
network_graph.edge_renderer.glyph = MultiLine(line_alpha=0.5, line_width=1)

plot.renderers.append(network_graph)

show(plot)
```



<div class="bk-root" id="5a908ed1-530c-42a1-be5a-da7b6023266f" data-root-id="2474"></div>





# Network with Nodes Colored By Attribute (Community)¶

<img src="{{ site.baseurl }}/assets/pngs/bokeh_plot (1).png" alt="Network with Nodes Colored By Attribute (Community)">

```python
# Import community detection module and get the communities
from networkx.algorithms import community
communities = community.greedy_modularity_communities(G)
```


```python
# Make a dictionary by looping through the communities and, for each member of the community, adding their community number
# Make another dictionary to store colors for modularity
modularity_class = {}
modularity_color = {}
count = 0
#Loop through each community in the network
for commun in communities:
    #For each member of the community, add their community number
    for name in commun:
        modularity_class[name] = count
        modularity_color[name] = Blues8[count] # Set a distinct color
    count += 1
modularity_color
```




    {'Lyn-Corbray': '#084594',
     'Moreo-Tumitis': '#084594',
     'Jon-Umber-(Greatjon)': '#084594',
     'Leo-Lefford': '#084594',
     'Robert-Arryn': '#084594',
     'Vardis-Egen': '#084594',
     'Maege-Mormont': '#084594',
     'Gunthor-son-of-Gurn': '#084594',
     'Rodrik-Cassel': '#084594',
     'Shae': '#084594',
     'Hoster-Tully': '#084594',
     'Marillion': '#084594',
     'Nan': '#084594',
     'Roose-Bolton': '#084594',
     'Tytos-Blackwood': '#084594',
     'Edmure-Tully': '#084594',
     'Mord': '#084594',
     'Eon-Hunter': '#084594',
     'Jyck': '#084594',
     'Colemon': '#084594',
     'Hali': '#084594',
     'Catelyn-Stark': '#084594',
     'Robb-Stark': '#084594',
     'Kevan-Lannister': '#084594',
     'Joseth': '#084594',
     'Kurleket': '#084594',
     'Masha-Heddle': '#084594',
     'Bran-Stark': '#084594',
     'Stiv': '#084594',
     'Rickon-Stark': '#084594',
     'Wendel-Manderly': '#084594',
     'Galbart-Glover': '#084594',
     'Hallis-Mollen': '#084594',
     'Morrec': '#084594',
     'Hullen': '#084594',
     'Brynden-Tully': '#084594',
     'Chella': '#084594',
     'Nestor-Royce': '#084594',
     'Lysa-Arryn': '#084594',
     'Harys-Swyft': '#084594',
     'Mychel-Redfort': '#084594',
     'Addam-Marbrand': '#084594',
     'Osha': '#084594',
     'Jory-Cassel': '#084594',
     'Jonos-Bracken': '#084594',
     'Donnel-Waynwood': '#084594',
     'Walder-Frey': '#084594',
     'Tyrion-Lannister': '#084594',
     'Bronn': '#084594',
     'Chiggen': '#084594',
     'Luwin': '#084594',
     'Jaime-Lannister': '#084594',
     'Stevron-Frey': '#084594',
     'Tywin-Lannister': '#084594',
     'Wyl-(guard)': '#084594',
     'Rickard-Karstark': '#084594',
     'Mya-Stone': '#084594',
     'Hodor': '#084594',
     'Willis-Wode': '#084594',
     'Heward': '#084594',
     'Theon-Greyjoy': '#084594',
     'Mace-Tyrell': '#2171b5',
     'Meryn-Trant': '#2171b5',
     'Sandor-Clegane': '#2171b5',
     'Joffrey-Baratheon': '#2171b5',
     'Robert-Baratheon': '#2171b5',
     'Janos-Slynt': '#2171b5',
     'Arys-Oakheart': '#2171b5',
     'Sansa-Stark': '#2171b5',
     'Mordane': '#2171b5',
     'Balon-Swann': '#2171b5',
     'Boros-Blount': '#2171b5',
     'Ilyn-Payne': '#2171b5',
     'Paxter-Redwyne': '#2171b5',
     'Beric-Dondarrion': '#2171b5',
     'Hugh': '#2171b5',
     'Stannis-Baratheon': '#2171b5',
     'Tommen-Baratheon': '#2171b5',
     'Renly-Baratheon': '#2171b5',
     'Gregor-Clegane': '#2171b5',
     'Barristan-Selmy': '#2171b5',
     'Syrio-Forel': '#2171b5',
     'Maegor-I-Targaryen': '#2171b5',
     'Arya-Stark': '#2171b5',
     'Petyr-Baelish': '#2171b5',
     'Myrcella-Baratheon': '#2171b5',
     'Jon-Arryn': '#2171b5',
     'Varys': '#2171b5',
     'Loras-Tyrell': '#2171b5',
     'Jeyne-Poole': '#2171b5',
     'Pycelle': '#2171b5',
     'Mycah': '#2171b5',
     'Lancel-Lannister': '#2171b5',
     'Cersei-Lannister': '#2171b5',
     'Thoros-of-Myr': '#2171b5',
     'Vayon-Poole': '#2171b5',
     'Joss': '#4292c6',
     'Aegon-I-Targaryen': '#4292c6',
     'Porther': '#4292c6',
     'Raymun-Darry': '#4292c6',
     'Brandon-Stark': '#4292c6',
     'Cayn': '#4292c6',
     'Daryn-Hornwood': '#4292c6',
     'High-Septon-(fat_one)': '#4292c6',
     'Gerold-Hightower': '#4292c6',
     'Clement-Piper': '#4292c6',
     'Karyl-Vance': '#4292c6',
     'Tregar': '#4292c6',
     'Aerys-II-Targaryen': '#4292c6',
     'Howland-Reed': '#4292c6',
     'Torrhen-Karstark': '#4292c6',
     'Tobho-Mott': '#4292c6',
     'Varly': '#4292c6',
     'Arthur-Dayne': '#4292c6',
     'Rickard-Stark': '#4292c6',
     'Balon-Greyjoy': '#4292c6',
     'Wylla': '#4292c6',
     'Marq-Piper': '#4292c6',
     'Gendry': '#4292c6',
     'Oswell-Whent': '#4292c6',
     'Tomard': '#4292c6',
     'Harwin': '#4292c6',
     'Desmond': '#4292c6',
     'Jacks': '#4292c6',
     'Alyn': '#4292c6',
     'Lyanna-Stark': '#4292c6',
     'Eddard-Stark': '#4292c6',
     'Randyll-Tarly': '#6baed6',
     'Jafer-Flowers': '#6baed6',
     'Waymar-Royce': '#6baed6',
     'Donal-Noye': '#6baed6',
     'Albett': '#6baed6',
     'Benjen-Stark': '#6baed6',
     'Hobb': '#6baed6',
     'Will-(prologue)': '#6baed6',
     'Jaremy-Rykker': '#6baed6',
     'Aemon-Targaryen-(Maester-Aemon)': '#6baed6',
     'Yoren': '#6baed6',
     'Othor': '#6baed6',
     'Mance-Rayder': '#6baed6',
     'Bowen-Marsh': '#6baed6',
     'Matthar': '#6baed6',
     'Dywen': '#6baed6',
     'Halder': '#6baed6',
     'Jon-Snow': '#6baed6',
     'Grenn': '#6baed6',
     'Pypar': '#6baed6',
     'Rast': '#6baed6',
     'Chett': '#6baed6',
     'Clydas': '#6baed6',
     'Gared': '#6baed6',
     'Todder': '#6baed6',
     'Samwell-Tarly': '#6baed6',
     'Jeor-Mormont': '#6baed6',
     'Alliser-Thorne': '#6baed6',
     'Dareon': '#6baed6',
     'Rhaegar-Targaryen': '#9ecae1',
     'Ogo': '#9ecae1',
     'Aggo': '#9ecae1',
     'Doreah': '#9ecae1',
     'Jhogo': '#9ecae1',
     'Jorah-Mormont': '#9ecae1',
     'Illyrio-Mopatis': '#9ecae1',
     'Jommo': '#9ecae1',
     'Eroeh': '#9ecae1',
     'Daenerys-Targaryen': '#9ecae1',
     'Irri': '#9ecae1',
     'Cohollo': '#9ecae1',
     'Fogo': '#9ecae1',
     'Qotho': '#9ecae1',
     'Rakharo': '#9ecae1',
     'Quaro': '#9ecae1',
     'Viserys-Targaryen': '#9ecae1',
     'Rhaego': '#9ecae1',
     'Drogo': '#9ecae1',
     'Haggo': '#9ecae1',
     'Jhiqui': '#9ecae1',
     'Mirri-Maz-Duur': '#9ecae1',
     'Ulf-son-of-Umar': '#c6dbef',
     'Shagga': '#c6dbef',
     'Coratt': '#c6dbef',
     'Dolf': '#c6dbef',
     'Timett': '#c6dbef',
     'Conn': '#c6dbef',
     'Hosteen-Frey': '#deebf7',
     'Jared-Frey': '#deebf7',
     'Danwell-Frey': '#deebf7'}




```python
# Add class and color as node attributes
networkx.set_node_attributes(G, modularity_class, 'modularity_class')
networkx.set_node_attributes(G, modularity_color, 'modularity_color')
```


```python
#Choose attributes from G network to size and color 
size_by_this_attribute = 'degree'
color_by_this_attribute = 'modularity_color' # (NEW)

#Choose a title
title = 'A Song of Ice and Fire (Book 1) Network'

#Establish which categories will appear when hovering over each node
HOVER_TOOLTIPS = [
       ("Character", "@index"),
       ("Degree", "@degree"),
       ("Modularity Class", "@modularity_class")
]

#Create a plot — set dimensions, toolbar, and title
plot = figure(tooltips = HOVER_TOOLTIPS,
              tools="pan,wheel_zoom,save,reset, tap", active_scroll='wheel_zoom',
            x_range=Range1d(-10.1, 10.1), y_range=Range1d(-10.1, 10.1), title=title)

#Create a network graph object
network_graph = from_networkx(G, networkx.spring_layout, scale=10, center=(0, 0))

#Set node sizes according to node degree and colors according to modularity class (color as category from attribute) (NEW)
network_graph.node_renderer.glyph = Circle(size=size_by_this_attribute, fill_color=color_by_this_attribute)

#Set edge opacity and width
network_graph.edge_renderer.glyph = MultiLine(line_alpha=0.5, line_width=1)

plot.renderers.append(network_graph)

show(plot)
```



<div class="bk-root" id="8d13d8e0-102a-4546-8822-1380511785c3" data-root-id="2795"></div>





# Task 3

<img src="{{ site.baseurl }}/assets/pngs/bokeh_plot (4).png" alt="Task 3">

```python
# Create a visualization, where node size is based on eigenvector centrality, and color is based on community.
# Copy the code in the last cell, and update the "size_by_this_attribute" based on eigenvector centrality, and update colors.
# The eigenvector_centrality attribute should be mutiplied by 100 to make the nodes visible. This can be realized by 
# writing a loop, and multiply the value of each node by 100, and add the result as a node attribute.
# The colors should be Spectral8 instead of Blues8. This can be realized by rerun the loop of setting colors for each community,
# and change the colors to Spectral8[count], and add the color as a node attribute again.

eigenvector_centrality = networkx.eigenvector_centrality(G)
for node in eigenvector_centrality:
    eigenvector_centrality[node] = eigenvector_centrality[node]*100
networkx.set_node_attributes(G, name='eigenvector', values=eigenvector_centrality)

count = 0
for commun in communities:
    for name in commun:
        modularity_color[name] = Spectral8[count]
    count += 1
networkx.set_node_attributes(G, modularity_color, 'modularity_color')

#Choose attributes from G network to size and color
size_by_this_attribute = 'eigenvector'
color_by_this_attribute = 'modularity_color'

#Choose a title
title = 'A Song of Ice and Fire (Book 1) Network'

#Establish which categories will appear when hovering over each node
HOVER_TOOLTIPS = [
       ("Character", "@index"),
       ("Eigenvector Centrality", "@eigenvector"),
       ("Modularity Class", "@modularity_class")
]

#Create a plot — set dimensions, toolbar, and title
plot = figure(tooltips = HOVER_TOOLTIPS,
              tools="pan,wheel_zoom,save,reset, tap", active_scroll='wheel_zoom',
            x_range=Range1d(-10.1, 10.1), y_range=Range1d(-10.1, 10.1), title=title)

#Create a network graph object
network_graph = from_networkx(G, networkx.spring_layout, scale=10, center=(0, 0))

#Set node sizes according to node degree and colors according to modularity class (color as category from attribute)
network_graph.node_renderer.glyph = Circle(size=size_by_this_attribute, fill_color=color_by_this_attribute)

#Set edge opacity and width
network_graph.edge_renderer.glyph = MultiLine(line_alpha=0.5, line_width=1)

plot.renderers.append(network_graph)

show(plot)
```



<div class="bk-root" id="675bf832-9215-4632-9473-dc1e2a6b249f" data-root-id="3130"></div>





# Network with Responsive Highlighting

<img src="{{ site.baseurl }}/assets/pngs/bokeh_plot (5).png" alt="Network with Responsive Highlighting">

```python
# Include EdgesAndLinkedNodes, NodesAndLinkedEdges
from bokeh.models import EdgesAndLinkedNodes, NodesAndLinkedEdges
```


```python
#Choose colors for node and edge highlighting (NEW)
node_highlight_color = 'white'
edge_highlight_color = 'black'

#Choose attributes from G network to size and color
size_by_this_attribute = 'degree'
color_by_this_attribute = 'modularity_color'

#Choose a title
title = 'A Song of Ice and Fire (Book 1) Network'

#Establish which categories will appear when hovering over each node
HOVER_TOOLTIPS = [
       ("Character", "@index"),
       ("Degree", "@degree"),
       ("Modularity Class", "@modularity_class")
]

#Create a plot — set dimensions, toolbar, and title
plot = figure(tooltips = HOVER_TOOLTIPS,
              tools="pan,wheel_zoom,save,reset, tap", active_scroll='wheel_zoom',
            x_range=Range1d(-10.1, 10.1), y_range=Range1d(-10.1, 10.1), title=title)

#Create a network graph object
network_graph = from_networkx(G, networkx.spring_layout, scale=10, center=(0, 0))

#Set node sizes according to node degree and colors according to modularity class (color as category from attribute)
network_graph.node_renderer.glyph = Circle(size=size_by_this_attribute, fill_color=color_by_this_attribute)

#Set edge opacity and width
network_graph.edge_renderer.glyph = MultiLine(line_alpha=0.5, line_width=1)

#Set node highlight colors (NEW)
network_graph.node_renderer.hover_glyph = Circle(size=size_by_this_attribute, fill_color=node_highlight_color, line_width=2)
network_graph.node_renderer.selection_glyph = Circle(size=size_by_this_attribute, fill_color=node_highlight_color, line_width=2)

#Set edge highlight colors (NEW)
network_graph.edge_renderer.selection_glyph = MultiLine(line_color=edge_highlight_color, line_width=2)
network_graph.edge_renderer.hover_glyph = MultiLine(line_color=edge_highlight_color, line_width=2)

#Highlight nodes and edges (NEW)
network_graph.selection_policy = NodesAndLinkedEdges()
network_graph.inspection_policy = NodesAndLinkedEdges()

plot.renderers.append(network_graph)

show(plot)
```



<div class="bk-root" id="c0d3b011-e18f-4d4c-b478-6281e840cf76" data-root-id="3486"></div>





# Network with Labels

<img src="{{ site.baseurl }}/assets/pngs/bokeh_plot (6).png" alt="Network with Responsive Labels">

```python
# Include LabelSet
from bokeh.models import LabelSet
```


```python
#Choose colors for node and edge highlighting
node_highlight_color = 'white'
edge_highlight_color = 'black'

#Choose attributes from G network to size and color
size_by_this_attribute = 'degree'
color_by_this_attribute = 'modularity_color'

#Choose a title
title = 'A Song of Ice and Fire (Book 1) Network'

#Establish which categories will appear when hovering over each node
HOVER_TOOLTIPS = [
       ("Character", "@index"),
       ("Degree", "@degree"),
       ("Modularity Class", "@modularity_class")
]

#Create a plot — set dimensions, toolbar, and title
plot = figure(tooltips = HOVER_TOOLTIPS,
              tools="pan,wheel_zoom,save,reset, tap", active_scroll='wheel_zoom',
            x_range=Range1d(-10.1, 10.1), y_range=Range1d(-10.1, 10.1), title=title)

#Create a network graph object
network_graph = from_networkx(G, networkx.spring_layout, scale=10, center=(0, 0))

#Set node sizes according to node degree and colors according to modularity class (color as category from attribute)
network_graph.node_renderer.glyph = Circle(size=size_by_this_attribute, fill_color=color_by_this_attribute)

#Set edge opacity and width
network_graph.edge_renderer.glyph = MultiLine(line_alpha=0.5, line_width=1)

#Set node highlight colors
network_graph.node_renderer.hover_glyph = Circle(size=size_by_this_attribute, fill_color=node_highlight_color, line_width=2)
network_graph.node_renderer.selection_glyph = Circle(size=size_by_this_attribute, fill_color=node_highlight_color, line_width=2)

#Set edge highlight colors
network_graph.edge_renderer.selection_glyph = MultiLine(line_color=edge_highlight_color, line_width=2)
network_graph.edge_renderer.hover_glyph = MultiLine(line_color=edge_highlight_color, line_width=2)

#Highlight nodes and edges
network_graph.selection_policy = NodesAndLinkedEdges()
network_graph.inspection_policy = NodesAndLinkedEdges()

plot.renderers.append(network_graph)

#Add Labels (NEW)
x, y = zip(*network_graph.layout_provider.graph_layout.values())
node_labels = list(G.nodes())
source = ColumnDataSource({'x': x, 'y': y, 'name': [node_labels[i] for i in range(len(x))]})
labels = LabelSet(x='x', y='y', text='name', source=source, background_fill_color='white', text_font_size='10px', background_fill_alpha=.7)
plot.renderers.append(labels)

show(plot)
```



<div class="bk-root" id="78b17cc1-6ea6-42b4-8f03-cc99c2c3c7be" data-root-id="3875"></div>






```python
asoiaf_b3_df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Source</th>
      <th>Target</th>
      <th>Type</th>
      <th>weight</th>
      <th>book</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Addam-Marbrand</td>
      <td>Gyles-Rosby</td>
      <td>Undirected</td>
      <td>3</td>
      <td>3</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Addam-Marbrand</td>
      <td>Jaime-Lannister</td>
      <td>Undirected</td>
      <td>3</td>
      <td>3</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Addam-Marbrand</td>
      <td>Jalabhar-Xho</td>
      <td>Undirected</td>
      <td>3</td>
      <td>3</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Addam-Marbrand</td>
      <td>Joffrey-Baratheon</td>
      <td>Undirected</td>
      <td>3</td>
      <td>3</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Addam-Marbrand</td>
      <td>Kevan-Lannister</td>
      <td>Undirected</td>
      <td>3</td>
      <td>3</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>1003</th>
      <td>Tyrion-Lannister</td>
      <td>Viserys-Targaryen</td>
      <td>Undirected</td>
      <td>4</td>
      <td>3</td>
    </tr>
    <tr>
      <th>1004</th>
      <td>Tyrion-Lannister</td>
      <td>Willas-Tyrell</td>
      <td>Undirected</td>
      <td>5</td>
      <td>3</td>
    </tr>
    <tr>
      <th>1005</th>
      <td>Tywin-Lannister</td>
      <td>Varys</td>
      <td>Undirected</td>
      <td>5</td>
      <td>3</td>
    </tr>
    <tr>
      <th>1006</th>
      <td>Tywin-Lannister</td>
      <td>Walder-Frey</td>
      <td>Undirected</td>
      <td>4</td>
      <td>3</td>
    </tr>
    <tr>
      <th>1007</th>
      <td>Vargo-Hoat</td>
      <td>Zollo</td>
      <td>Undirected</td>
      <td>3</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
<p>1008 rows × 5 columns</p>
</div>



# Task 4

<img src="{{ site.baseurl }}/assets/pngs/bokeh_plot (7).png" alt="Task 4">

```python
# Duplicate the process above to create a visualization based on data of A Song of Ice and Fire Book 3.
# The node size should be based on degree centrality, and color should be based on community, and responsive highlighting and
# labels should also be included.
# You have to create a new network based on asoiaf_b3_df, recalculate degree of the new network and add it as node attribute.
# Then you should regenerate communities of the new network, rerun the loop to generate community number and colors, and add
# both modularity class and color as node attributes.
# Finally, copy the code in the last cell, and change the title, and update network names when creating graph and adding labels.

asoiaf_b3_df = pd.read_csv('Data/asoiaf-book3-edges.csv')
G_b3 = networkx.from_pandas_edgelist(asoiaf_b3_df, 'Source', 'Target', 'weight')
degrees_b3 = dict(networkx.degree(G_b3))
networkx.set_node_attributes(G_b3, name='degree', values=degrees_b3)

communities_b3 = community.greedy_modularity_communities(G_b3)
modularity_class_b3 = {}
modularity_color_b3 = {}
count = 0
for commun in communities_b3:
    for name in commun:
        modularity_class_b3[name] = count
        modularity_color_b3[name] = Spectral8[count]
    count += 1
networkx.set_node_attributes(G_b3, modularity_class_b3, 'modularity_class')
networkx.set_node_attributes(G_b3, modularity_color_b3, 'modularity_color')

#Choose colors for node and edge highlighting
node_highlight_color = 'white'
edge_highlight_color = 'black'

#Choose attributes from G network to size and color
size_by_this_attribute = 'degree'
color_by_this_attribute = 'modularity_color'

#Choose a title
title = 'A Song of Ice and Fire (Book 3) Network'

#Establish which categories will appear when hovering over each node
HOVER_TOOLTIPS = [
       ("Character", "@index"),
       ("Degree", "@degree"),
       ("Modularity Class", "@modularity_class")
]

#Create a plot — set dimensions, toolbar, and title
plot = figure(tooltips = HOVER_TOOLTIPS,
              tools="pan,wheel_zoom,save,reset, tap", active_scroll='wheel_zoom',
            x_range=Range1d(-10.1, 10.1), y_range=Range1d(-10.1, 10.1), title=title)

#Create a network graph object
network_graph = from_networkx(G_b3, networkx.spring_layout, scale=10, center=(0, 0))

#Set node sizes according to node degree and colors according to modularity class (color as category from attribute)
network_graph.node_renderer.glyph = Circle(size=size_by_this_attribute, fill_color=color_by_this_attribute)

#Set edge opacity and width
network_graph.edge_renderer.glyph = MultiLine(line_alpha=0.5, line_width=1)

#Set node highlight colors
network_graph.node_renderer.hover_glyph = Circle(size=size_by_this_attribute, fill_color=node_highlight_color, line_width=2)
network_graph.node_renderer.selection_glyph = Circle(size=size_by_this_attribute, fill_color=node_highlight_color, line_width=2)

#Set edge highlight colors
network_graph.edge_renderer.selection_glyph = MultiLine(line_color=edge_highlight_color, line_width=2)
network_graph.edge_renderer.hover_glyph = MultiLine(line_color=edge_highlight_color, line_width=2)

#Highlight nodes and edges
network_graph.selection_policy = NodesAndLinkedEdges()
network_graph.inspection_policy = NodesAndLinkedEdges()

plot.renderers.append(network_graph)

#Add Labels
x, y = zip(*network_graph.layout_provider.graph_layout.values())
node_labels = list(G_b3.nodes())
source = ColumnDataSource({'x': x, 'y': y, 'name': [node_labels[i] for i in range(len(x))]})
labels = LabelSet(x='x', y='y', text='name', source=source, background_fill_color='white', text_font_size='10px', background_fill_alpha=.7)
plot.renderers.append(labels)

show(plot)
```



<div class="bk-root" id="9476c0a6-ea3a-45fe-adc9-6396b2183fc7" data-root-id="4298"></div>





# Network Simulation


```python
# Generate the list of people in the network

p1 = list(asoiaf_df['Source']) # convert "Source" in the dataframe to a list
p2 = list(asoiaf_df['Target']) # convert "Target" in the dataframe to a list
people = p1 + p2 # concatenate the two lists
print(len(people)) # let's see how many people we have

people = list(set(people)) # remove the duplicates
node_num = len(people) # number of nodes (people) in the network: the length of the people list
print(node_num) # let's see how many people we have now
print(people) # what the list looks like
```

    1368
    187
    ['Mace-Tyrell', 'Aggo', 'Sandor-Clegane', 'Robert-Arryn', 'Illyrio-Mopatis', 'Karyl-Vance', 'Janos-Slynt', 'Othor', 'Bowen-Marsh', 'Tytos-Blackwood', 'Rickard-Stark', 'Matthar', 'Grenn', 'Marq-Piper', 'Wylla', 'Mordane', 'Mord', 'Harwin', 'Colemon', 'Gared', 'Alyn', 'Lyanna-Stark', 'Eddard-Stark', 'Bran-Stark', 'Masha-Heddle', 'Aegon-I-Targaryen', 'Rickon-Stark', 'Tommen-Baratheon', 'Jared-Frey', 'Tregar', 'Mychel-Redfort', 'Cohollo', 'Gendry', 'Mycah', 'Mya-Stone', 'Hodor', 'Heward', 'Joss', 'Dolf', 'Ogo', 'Meryn-Trant', 'Albett', 'Joffrey-Baratheon', 'Rodrik-Cassel', 'Hoster-Tully', 'Dywen', 'Timett', 'Quaro', 'Tomard', 'Pypar', 'Jyck', 'Catelyn-Stark', 'Robb-Stark', 'Paxter-Redwyne', 'Kurleket', 'Mirri-Maz-Duur', 'Randyll-Tarly', 'Porther', 'Barristan-Selmy', 'Morrec', 'Hullen', 'Doreah', 'Donal-Noye', 'Waymar-Royce', 'Nestor-Royce', 'Maegor-I-Targaryen', 'Daenerys-Targaryen', 'Arya-Stark', 'Torrhen-Karstark', 'Harys-Swyft', 'Jon-Arryn', 'Qotho', 'Halder', 'Jon-Snow', 'Rakharo', 'Jaime-Lannister', 'Conn', 'Stevron-Frey', 'Lancel-Lannister', 'Rickard-Karstark', 'Samwell-Tarly', 'Varly', 'Vayon-Poole', 'Danwell-Frey', 'Moreo-Tumitis', 'Gerold-Hightower', 'Benjen-Stark', 'Vardis-Egen', 'Maege-Mormont', 'Shae', 'Robert-Baratheon', 'Howland-Reed', 'Mance-Rayder', 'Marillion', 'Arthur-Dayne', 'Nan', 'Roose-Bolton', 'Sansa-Stark', 'Edmure-Tully', 'Viserys-Targaryen', 'Oswell-Whent', 'Rast', 'Ulf-son-of-Umar', 'Ilyn-Payne', 'Desmond', 'Drogo', 'Dareon', 'Haggo', 'Rhaegar-Targaryen', 'Stannis-Baratheon', 'Wendel-Manderly', 'Gregor-Clegane', 'Cayn', 'Hallis-Mollen', 'Raymun-Darry', 'Brynden-Tully', 'Jhogo', 'Aerys-II-Targaryen', 'Will-(prologue)', 'Hosteen-Frey', 'Jaremy-Rykker', 'Yoren', 'Petyr-Baelish', 'Osha', 'Tobho-Mott', 'Jory-Cassel', 'Varys', 'Loras-Tyrell', 'Cersei-Lannister', 'Thoros-of-Myr', 'Jhiqui', 'Lyn-Corbray', 'Jafer-Flowers', 'High-Septon-(fat_one)', 'Jon-Umber-(Greatjon)', 'Leo-Lefford', 'Gunthor-son-of-Gurn', 'Eroeh', 'Irri', 'Arys-Oakheart', 'Coratt', 'Jacks', 'Eon-Hunter', 'Chett', 'Balon-Swann', 'Shagga', 'Boros-Blount', 'Hali', 'Kevan-Lannister', 'Beric-Dondarrion', 'Joseth', 'Hugh', 'Stiv', 'Galbart-Glover', 'Renly-Baratheon', 'Brandon-Stark', 'Daryn-Hornwood', 'Chella', 'Clement-Piper', 'Jorah-Mormont', 'Hobb', 'Jommo', 'Syrio-Forel', 'Lysa-Arryn', 'Aemon-Targaryen-(Maester-Aemon)', 'Addam-Marbrand', 'Myrcella-Baratheon', 'Fogo', 'Jonos-Bracken', 'Walder-Frey', 'Tyrion-Lannister', 'Donnel-Waynwood', 'Balon-Greyjoy', 'Bronn', 'Chiggen', 'Luwin', 'Jeyne-Poole', 'Pycelle', 'Tywin-Lannister', 'Clydas', 'Rhaego', 'Wyl-(guard)', 'Todder', 'Willis-Wode', 'Jeor-Mormont', 'Alliser-Thorne', 'Theon-Greyjoy']
    


```python
# Generate the matrix of people's relationships

relation_matrix = np.zeros((len(people), len(people)))  # create a 187*187 empty matrix

for i in range(len(asoiaf_df)): # loop through each line (relationship) in the data
    p1_index = people.index(asoiaf_df.loc[i, 'Source']) # get the index of "Source" in the list of people
    p2_index = people.index(asoiaf_df.loc[i, 'Target']) # get the index of "Target" in the list of people
    relation_matrix[p1_index, p2_index] = 1 # assign value, which means "Source has relationship with Target"
    relation_matrix[p2_index, p1_index] = 1 # correspondingly, assign value, which means "Target has relationship with Source"
    # Here, for the pairs of people with multiple relationships, we assign value 1 for multiple times, and the value is still 1
print(relation_matrix.shape) # let's see how large the matrix is
print(relation_matrix) # what the matrix looks like

edge_num = int(sum(sum(relation_matrix))/2) # sum all relationships and divide 2 (as each relationship is calculated twice)
print("The number of total edges in the network is {}".format(edge_num)) # let's see the number of total edges in the network
```

    (187, 187)
    [[0. 0. 0. ... 0. 0. 0.]
     [0. 0. 0. ... 0. 0. 0.]
     [0. 0. 0. ... 0. 0. 0.]
     ...
     [0. 0. 0. ... 0. 1. 0.]
     [0. 0. 0. ... 1. 0. 0.]
     [0. 0. 0. ... 0. 0. 0.]]
    The number of total edges in the network is 684
    


```python
# Generate the degree distribution

deg_num_dict = {} # an empty dictionary to record the number of nodes of each degree, key: degree; value: number of nodes with that degree

for i in range(len(relation_matrix)): # loop through the relation matrix
    deg_i  = sum(relation_matrix[i,]) # for each node (person), its degree is the summation of the line (number of its relationships)
    key = int(deg_i)
    if key in deg_num_dict.keys(): # add one to the number of nodes of that degree, if there are already some nodes
        deg_num_dict[key] += 1
    else:
        deg_num_dict[key] = 1 # assign value one as the number of nodes of that degree, if there is no node

deg_num_dict # what the dictionary looks like
```




    {2: 26,
     6: 16,
     16: 1,
     3: 17,
     7: 10,
     1: 48,
     5: 14,
     11: 3,
     4: 8,
     66: 1,
     32: 1,
     9: 3,
     8: 5,
     30: 2,
     18: 3,
     43: 1,
     35: 2,
     14: 4,
     21: 2,
     27: 1,
     15: 3,
     37: 1,
     29: 1,
     10: 3,
     12: 3,
     50: 1,
     19: 1,
     26: 1,
     17: 1,
     13: 2,
     46: 1,
     22: 1}




```python
# Sort the degree distribution

sort_deg_num_list = sorted(deg_num_dict.items(), key=lambda d:-d[0]) # sort the dictionary and reorder it by degree number 
sort_deg_num_list # what the dictionary looks like after sorting
```




    [(66, 1),
     (50, 1),
     (46, 1),
     (43, 1),
     (37, 1),
     (35, 2),
     (32, 1),
     (30, 2),
     (29, 1),
     (27, 1),
     (26, 1),
     (22, 1),
     (21, 2),
     (19, 1),
     (18, 3),
     (17, 1),
     (16, 1),
     (15, 3),
     (14, 4),
     (13, 2),
     (12, 3),
     (11, 3),
     (10, 3),
     (9, 3),
     (8, 5),
     (7, 10),
     (6, 16),
     (5, 14),
     (4, 8),
     (3, 17),
     (2, 26),
     (1, 48)]




```python
# Generate the nodes and the number of nodes of each degree

deg_num_list = [[i for i, j in sort_deg_num_list], 
               [j for i, j in sort_deg_num_list]]  # unzip the tuples to two lists
degs = deg_num_list[0] # the first list is degree
nums = deg_num_list[1] # the second list is number of nodes of each degree
print(degs) # what the list of degrees looks like
print(nums) # what the number of nodes of each degree looks like
```

    [66, 50, 46, 43, 37, 35, 32, 30, 29, 27, 26, 22, 21, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
    [1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 2, 1, 3, 1, 1, 3, 4, 2, 3, 3, 3, 3, 5, 10, 16, 14, 8, 17, 26, 48]
    


```python
# Visualization

plt.style.use('ggplot') # use the "ggplot" style
fig1 = plt.scatter(nums, degs, color = 'blue') # plot a scatterplot of degrees in the x axis and the number of nodes in the y axis
plt.xlabel('Number of Nodes') # set the label of the x axis
plt.ylabel('Degree') # set the label of the y axis
```




    Text(0, 0.5, 'Degree')




    
![png](output_48_1.png)
    



```python
# Preferential attachment model

import math, random # library "random", for generating the random number

def preferential_attachment(k): # the preferential attachment model
    dNetwork = {} # dictionary of lists
    iNodes = node_num # total number of nodes in the network
    iLinks = 0 # set the initial number of links (edges/relationships) as 0

    for i in range(iNodes): # loop through all the nodes
        dNetwork[i] = [] # initialize node i with a empty list, which will record its link with other nodes
        for node in dNetwork.values(): 
            fThresh = 1.0 / (iLinks + i + 1) * k *(len(node) + 1) 
            # create a "threshold" value, which is proportional to its current degree + 1,
            # and inversly proportional to the total number of links in the network
            if(random.random() <= fThresh): # if the random value (a random number between 0 and 1) is smaller than the threshold
                node.append(i) # add a link between this node and the node "i"
                iLinks += 1 # add one to the total number of links in the network
    lDegrees = [len(node) for node in dNetwork.values()] # calculate the degree distribution
    return lDegrees, iLinks
```


```python
# Run the preferential attachment model
def run_pa(k): 
    # k is a parameter which influences the fThresh (so that influence the probability of generating links)
    # I set k=3.7 below, but you can try to change the number and see what will happen!

    lDegrees,iLinks = preferential_attachment(k) # get the degrees and number of links generated in the preferential attachment model
    # below we duplicated what we have done earlier
    deg_num_sim_dict = {}
    for i in lDegrees :
        if i in deg_num_sim_dict.keys():
            deg_num_sim_dict[i] += 1
        else:
            deg_num_sim_dict[i] = 1

    sort_deg_num_sim_list = sorted(deg_num_sim_dict.items(), key=lambda d:-d[0])

    deg_num_sim_list = [[i for i, j in sort_deg_num_sim_list], 
                       [j for i, j in sort_deg_num_sim_list]]
    degs_sim = deg_num_sim_list[0]
    nums_sim = deg_num_sim_list[1]
    
    return degs_sim, nums_sim, iLinks
```


```python
iLinks = 0 # initialize iLinks = 0

# We will simulate the network so that it will have exactly the same number of nodes (already guaranteed) and edges as the observed network
while iLinks != edge_num: # so, we will loop until the requirement of the edge number is satisfied
    degs_sim, nums_sim, iLinks = run_pa(3.7) # run the preferential attachment model
    print(iLinks) # print the number of total links in the network
```

    666
    669
    654
    711
    684
    


```python
# Visualization of both the simulated network and the observed network

plt.scatter(nums_sim, degs_sim, color = 'red', label = 'Simulated')  # plot a scatterplot of the simulated network
plt.scatter(nums, degs, color='blue', label='Observed') # plot a scatterplot of the observed network
plt.xlabel('Number of Nodes') # set the label of the x axis
plt.ylabel('Degree') # set the label of the y axis
plt.legend() # display the legend
```




    <matplotlib.legend.Legend at 0x20f40ed1950>




    
![png](output_52_1.png)
    





