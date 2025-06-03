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
One of the primary applications of natural language processing is to automatically extract what topics people are discussing from large volumes of text. We need an automated algorithm that can read through the text documents and automatically output the topics discussed. In this lab, we will use Latent Dirichlet Allocation(LDA), a popular algorithm for topic modeling. LDA is a Bayesian network that explains a set of observations through unobserved groups, and each group explains why some parts of the data are similar.

# Preprocessing


```python
# Installing nltk for generating stop words. Stop words are commonly used words (such as "the", "a", "an", "in")
# that we want our topic models to ignore (as they are not suggestive to "topics")
! pip install nltk
```

    Requirement already satisfied: nltk in c:\users\colto\anaconda3\lib\site-packages (3.8.1)
    Requirement already satisfied: click in c:\users\colto\anaconda3\lib\site-packages (from nltk) (8.0.4)
    Requirement already satisfied: joblib in c:\users\colto\anaconda3\lib\site-packages (from nltk) (1.2.0)
    Requirement already satisfied: regex>=2021.8.3 in c:\users\colto\anaconda3\lib\site-packages (from nltk) (2022.7.9)
    Requirement already satisfied: tqdm in c:\users\colto\anaconda3\lib\site-packages (from nltk) (4.65.0)
    Requirement already satisfied: colorama in c:\users\colto\anaconda3\lib\site-packages (from click->nltk) (0.4.6)
    


```python
# Loading nltk stop words
import nltk
nltk.download('stopwords')
```

    [nltk_data] Downloading package stopwords to
    [nltk_data]     C:\Users\colto\AppData\Roaming\nltk_data...
    [nltk_data]   Package stopwords is already up-to-date!
    




    True




```python
# Import other packages
import re # regular expression
import numpy as np # performing calculations on arrays
import pandas as pd # dealing with dataframe

# Gensim, for topic modeling
import gensim
import gensim.corpora as corpora
from gensim.utils import simple_preprocess
from gensim.models import CoherenceModel

# Plotting tools
import matplotlib.pyplot as plt
%matplotlib inline
```


```python
# Prepare stop words
from nltk.corpus import stopwords
stop_words = stopwords.words('english')
print(stop_words)
```

    ['a', 'about', 'above', 'after', 'again', 'against', 'ain', 'all', 'am', 'an', 'and', 'any', 'are', 'aren', "aren't", 'as', 'at', 'be', 'because', 'been', 'before', 'being', 'below', 'between', 'both', 'but', 'by', 'can', 'couldn', "couldn't", 'd', 'did', 'didn', "didn't", 'do', 'does', 'doesn', "doesn't", 'doing', 'don', "don't", 'down', 'during', 'each', 'few', 'for', 'from', 'further', 'had', 'hadn', "hadn't", 'has', 'hasn', "hasn't", 'have', 'haven', "haven't", 'having', 'he', "he'd", "he'll", 'her', 'here', 'hers', 'herself', "he's", 'him', 'himself', 'his', 'how', 'i', "i'd", 'if', "i'll", "i'm", 'in', 'into', 'is', 'isn', "isn't", 'it', "it'd", "it'll", "it's", 'its', 'itself', "i've", 'just', 'll', 'm', 'ma', 'me', 'mightn', "mightn't", 'more', 'most', 'mustn', "mustn't", 'my', 'myself', 'needn', "needn't", 'no', 'nor', 'not', 'now', 'o', 'of', 'off', 'on', 'once', 'only', 'or', 'other', 'our', 'ours', 'ourselves', 'out', 'over', 'own', 're', 's', 'same', 'shan', "shan't", 'she', "she'd", "she'll", "she's", 'should', 'shouldn', "shouldn't", "should've", 'so', 'some', 'such', 't', 'than', 'that', "that'll", 'the', 'their', 'theirs', 'them', 'themselves', 'then', 'there', 'these', 'they', "they'd", "they'll", "they're", "they've", 'this', 'those', 'through', 'to', 'too', 'under', 'until', 'up', 've', 'very', 'was', 'wasn', "wasn't", 'we', "we'd", "we'll", "we're", 'were', 'weren', "weren't", "we've", 'what', 'when', 'where', 'which', 'while', 'who', 'whom', 'why', 'will', 'with', 'won', "won't", 'wouldn', "wouldn't", 'y', 'you', "you'd", "you'll", 'your', "you're", 'yours', 'yourself', 'yourselves', "you've"]
    


```python
# Load dataset
# The dataset is available at https://raw.githubusercontent.com/selva86/datasets/master/newsgroups.json
df = pd.read_json("Data/newsgroups.json")
df
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
      <th>content</th>
      <th>target</th>
      <th>target_names</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>From: lerxst@wam.umd.edu (where's my thing)\nS...</td>
      <td>7</td>
      <td>rec.autos</td>
    </tr>
    <tr>
      <th>1</th>
      <td>From: guykuo@carson.u.washington.edu (Guy Kuo)...</td>
      <td>4</td>
      <td>comp.sys.mac.hardware</td>
    </tr>
    <tr>
      <th>2</th>
      <td>From: twillis@ec.ecn.purdue.edu (Thomas E Will...</td>
      <td>4</td>
      <td>comp.sys.mac.hardware</td>
    </tr>
    <tr>
      <th>3</th>
      <td>From: jgreen@amber (Joe Green)\nSubject: Re: W...</td>
      <td>1</td>
      <td>comp.graphics</td>
    </tr>
    <tr>
      <th>4</th>
      <td>From: jcm@head-cfa.harvard.edu (Jonathan McDow...</td>
      <td>14</td>
      <td>sci.space</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>11309</th>
      <td>From: jim.zisfein@factory.com (Jim Zisfein) \n...</td>
      <td>13</td>
      <td>sci.med</td>
    </tr>
    <tr>
      <th>11310</th>
      <td>From: ebodin@pearl.tufts.edu\nSubject: Screen ...</td>
      <td>4</td>
      <td>comp.sys.mac.hardware</td>
    </tr>
    <tr>
      <th>11311</th>
      <td>From: westes@netcom.com (Will Estes)\nSubject:...</td>
      <td>3</td>
      <td>comp.sys.ibm.pc.hardware</td>
    </tr>
    <tr>
      <th>11312</th>
      <td>From: steve@hcrlgw (Steven Collins)\nSubject: ...</td>
      <td>1</td>
      <td>comp.graphics</td>
    </tr>
    <tr>
      <th>11313</th>
      <td>From: gunning@cco.caltech.edu (Kevin J. Gunnin...</td>
      <td>8</td>
      <td>rec.motorcycles</td>
    </tr>
  </tbody>
</table>
<p>11314 rows × 3 columns</p>
</div>




```python
# We are only using the first 1,000 documents because model training can be time-consuming
df = df.iloc[:1000,:]
df
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
      <th>content</th>
      <th>target</th>
      <th>target_names</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>From: lerxst@wam.umd.edu (where's my thing)\nS...</td>
      <td>7</td>
      <td>rec.autos</td>
    </tr>
    <tr>
      <th>1</th>
      <td>From: guykuo@carson.u.washington.edu (Guy Kuo)...</td>
      <td>4</td>
      <td>comp.sys.mac.hardware</td>
    </tr>
    <tr>
      <th>2</th>
      <td>From: twillis@ec.ecn.purdue.edu (Thomas E Will...</td>
      <td>4</td>
      <td>comp.sys.mac.hardware</td>
    </tr>
    <tr>
      <th>3</th>
      <td>From: jgreen@amber (Joe Green)\nSubject: Re: W...</td>
      <td>1</td>
      <td>comp.graphics</td>
    </tr>
    <tr>
      <th>4</th>
      <td>From: jcm@head-cfa.harvard.edu (Jonathan McDow...</td>
      <td>14</td>
      <td>sci.space</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>995</th>
      <td>From: ibeshir@nyx.cs.du.edu (Ibrahim)\nSubject...</td>
      <td>6</td>
      <td>misc.forsale</td>
    </tr>
    <tr>
      <th>996</th>
      <td>From: anwar+@cs.cmu.edu (Anwar Mohammed)\nSubj...</td>
      <td>17</td>
      <td>talk.politics.mideast</td>
    </tr>
    <tr>
      <th>997</th>
      <td>From: DJCOHEN@YaleVM.YCC.Yale.Edu (Daniel Cohe...</td>
      <td>4</td>
      <td>comp.sys.mac.hardware</td>
    </tr>
    <tr>
      <th>998</th>
      <td>From: geb@cs.pitt.edu (Gordon Banks)\nSubject:...</td>
      <td>13</td>
      <td>sci.med</td>
    </tr>
    <tr>
      <th>999</th>
      <td>From: dxf12@po.cwru.edu (Douglas Fowler)\nSubj...</td>
      <td>15</td>
      <td>soc.religion.christian</td>
    </tr>
  </tbody>
</table>
<p>1000 rows × 3 columns</p>
</div>



# Data cleaning


```python
# Get the first document
data = df.content.values.tolist()
data[0]
```




    "From: lerxst@wam.umd.edu (where's my thing)\nSubject: WHAT car is this!?\nNntp-Posting-Host: rac3.wam.umd.edu\nOrganization: University of Maryland, College Park\nLines: 15\n\n I was wondering if anyone out there could enlighten me on this car I saw\nthe other day. It was a 2-door sports car, looked to be from the late 60s/\nearly 70s. It was called a Bricklin. The doors were really small. In addition,\nthe front bumper was separate from the rest of the body. This is \nall I know. If anyone can tellme a model name, engine specs, years\nof production, where this car is made, history, or whatever info you\nhave on this funky looking car, please e-mail.\n\nThanks,\n- IL\n   ---- brought to you by your neighborhood Lerxst ----\n\n\n\n\n"




```python
# Removing Emails
email_pattern = re.compile("\S*@\S*\s?") # \S means matching a character, \s means matching a space
                                         # * means matching 0 or multiple times, ? means matching 0 or 1 times
for i in range(len(data)):
    data[i] = re.sub(email_pattern, '', data[i])
print(data[0])
```

    From: (where's my thing)
    Subject: WHAT car is this!?
    Nntp-Posting-Host: rac3.wam.umd.edu
    Organization: University of Maryland, College Park
    Lines: 15
    
     I was wondering if anyone out there could enlighten me on this car I saw
    the other day. It was a 2-door sports car, looked to be from the late 60s/
    early 70s. It was called a Bricklin. The doors were really small. In addition,
    the front bumper was separate from the rest of the body. This is 
    all I know. If anyone can tellme a model name, engine specs, years
    of production, where this car is made, history, or whatever info you
    have on this funky looking car, please e-mail.
    
    Thanks,
    - IL
       ---- brought to you by your neighborhood Lerxst ----
    
    
    
    
    
    


```python
# Removing new line characters
new_line_pattern = re.compile("\s+") # + means matching 1 or more times
for i in range(len(data)):
    data[i] = re.sub(new_line_pattern, ' ', data[i]) # converting line breaks and multiple spaces into one space
print(data[0])
```

    From: (where's my thing) Subject: WHAT car is this!? Nntp-Posting-Host: rac3.wam.umd.edu Organization: University of Maryland, College Park Lines: 15 I was wondering if anyone out there could enlighten me on this car I saw the other day. It was a 2-door sports car, looked to be from the late 60s/ early 70s. It was called a Bricklin. The doors were really small. In addition, the front bumper was separate from the rest of the body. This is all I know. If anyone can tellme a model name, engine specs, years of production, where this car is made, history, or whatever info you have on this funky looking car, please e-mail. Thanks, - IL ---- brought to you by your neighborhood Lerxst ---- 
    


```python
# Tokenize words using gensim's simple_preprocess
for i in range(len(data)):
    data[i] = gensim.utils.simple_preprocess(str(data[i]), deacc=True) # deacc=True means removing punctuations
print(data[0])
```

    ['from', 'where', 'my', 'thing', 'subject', 'what', 'car', 'is', 'this', 'nntp', 'posting', 'host', 'rac', 'wam', 'umd', 'edu', 'organization', 'university', 'of', 'maryland', 'college', 'park', 'lines', 'was', 'wondering', 'if', 'anyone', 'out', 'there', 'could', 'enlighten', 'me', 'on', 'this', 'car', 'saw', 'the', 'other', 'day', 'it', 'was', 'door', 'sports', 'car', 'looked', 'to', 'be', 'from', 'the', 'late', 'early', 'it', 'was', 'called', 'bricklin', 'the', 'doors', 'were', 'really', 'small', 'in', 'addition', 'the', 'front', 'bumper', 'was', 'separate', 'from', 'the', 'rest', 'of', 'the', 'body', 'this', 'is', 'all', 'know', 'if', 'anyone', 'can', 'tellme', 'model', 'name', 'engine', 'specs', 'years', 'of', 'production', 'where', 'this', 'car', 'is', 'made', 'history', 'or', 'whatever', 'info', 'you', 'have', 'on', 'this', 'funky', 'looking', 'car', 'please', 'mail', 'thanks', 'il', 'brought', 'to', 'you', 'by', 'your', 'neighborhood', 'lerxst']
    


```python
# Removing stop words
for i in range(len(data)):
    data[i] = [word for word in data[i] if word not in stop_words]
print(data[0])
```

    ['thing', 'subject', 'car', 'nntp', 'posting', 'host', 'rac', 'wam', 'umd', 'edu', 'organization', 'university', 'maryland', 'college', 'park', 'lines', 'wondering', 'anyone', 'could', 'enlighten', 'car', 'saw', 'day', 'door', 'sports', 'car', 'looked', 'late', 'early', 'called', 'bricklin', 'doors', 'really', 'small', 'addition', 'front', 'bumper', 'separate', 'rest', 'body', 'know', 'anyone', 'tellme', 'model', 'name', 'engine', 'specs', 'years', 'production', 'car', 'made', 'history', 'whatever', 'info', 'funky', 'looking', 'car', 'please', 'mail', 'thanks', 'il', 'brought', 'neighborhood', 'lerxst']
    

# Including bigrams


```python
# The basic idea here is we group words that frequently appear together to a phrase
bigram = gensim.models.Phrases(data, min_count=5, threshold=100)
bigram_mod = gensim.models.phrases.Phraser(bigram)
print(bigram_mod[data[0]])
```

    ['thing', 'subject', 'car', 'nntp_posting', 'host', 'rac', 'wam', 'umd', 'edu', 'organization', 'university', 'maryland', 'college', 'park', 'lines', 'wondering', 'anyone', 'could', 'enlighten', 'car', 'saw', 'day', 'door', 'sports', 'car', 'looked', 'late', 'early', 'called', 'bricklin', 'doors', 'really', 'small', 'addition', 'front', 'bumper', 'separate', 'rest', 'body', 'know', 'anyone', 'tellme', 'model', 'name', 'engine', 'specs', 'years', 'production', 'car', 'made', 'history', 'whatever', 'info', 'funky', 'looking', 'car', 'please', 'mail', 'thanks', 'il', 'brought', 'neighborhood', 'lerxst']
    

# Task 1

What would be the impact of changing the 'min_count' to 1 when generating bigrams? Please redefine the bigrams with the new 'min_count' setting and rerun the experiment. Print the updated word list of data\[0\] with these new bigrams.
<br>Are there more or fewer words grouped together compared to the original result obtained with a 'min_count' setting of 5? Are these additional or removed bigrams meaningful? Provide an assessment of the advantages and disadvantages of this change and suggest whether the change is advisable.
<br>Include your codes in the following cell (code) and the discussion in the next cell (markdown).


```python
bigram_new = gensim.models.Phrases(data, min_count=1, threshold=100)
bigram_mod_new = gensim.models.phrases.Phraser(bigram_new)
print(bigram_mod_new[data[0]])
```

    ['thing', 'subject', 'car', 'nntp_posting', 'host', 'rac', 'wam', 'umd_edu', 'organization', 'university', 'maryland_college', 'park', 'lines', 'wondering', 'anyone', 'could_enlighten', 'car', 'saw', 'day', 'door_sports', 'car', 'looked_late', 'early', 'called_bricklin', 'doors_really', 'small', 'addition_front', 'bumper_separate', 'rest', 'body', 'know', 'anyone_tellme', 'model_name', 'engine_specs', 'years', 'production', 'car', 'made', 'history', 'whatever', 'info_funky', 'looking', 'car', 'please', 'mail', 'thanks', 'il', 'brought_neighborhood', 'lerxst']
    



# Creating models


```python
# Convert each document to a list of words including generated bigrams 
bigram = gensim.models.Phrases(data, min_count=5, threshold=100)
bigram_mod = gensim.models.phrases.Phraser(bigram)
data_words_bigrams = []
for i in range(len(data)):
    data_words_bigrams.append(bigram_mod[data[i]])
print(data_words_bigrams[0])
```

    ['thing', 'subject', 'car', 'nntp_posting', 'host', 'rac', 'wam', 'umd', 'edu', 'organization', 'university', 'maryland', 'college', 'park', 'lines', 'wondering', 'anyone', 'could', 'enlighten', 'car', 'saw', 'day', 'door', 'sports', 'car', 'looked', 'late', 'early', 'called', 'bricklin', 'doors', 'really', 'small', 'addition', 'front', 'bumper', 'separate', 'rest', 'body', 'know', 'anyone', 'tellme', 'model', 'name', 'engine', 'specs', 'years', 'production', 'car', 'made', 'history', 'whatever', 'info', 'funky', 'looking', 'car', 'please', 'mail', 'thanks', 'il', 'brought', 'neighborhood', 'lerxst']
    


```python
# Create the Dictionary for topic modeling
id2word = corpora.Dictionary(data_words_bigrams)
id2word
```




    <gensim.corpora.dictionary.Dictionary at 0x22b10749650>




```python
# Create the Corpus for topic modeling
corpus = [id2word.doc2bow(text) for text in data_words_bigrams]
print(corpus[0])
```

    [(0, 1), (1, 2), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 5), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1), (17, 1), (18, 1), (19, 1), (20, 1), (21, 1), (22, 1), (23, 1), (24, 1), (25, 1), (26, 1), (27, 1), (28, 1), (29, 1), (30, 1), (31, 1), (32, 1), (33, 1), (34, 1), (35, 1), (36, 1), (37, 1), (38, 1), (39, 1), (40, 1), (41, 1), (42, 1), (43, 1), (44, 1), (45, 1), (46, 1), (47, 1), (48, 1), (49, 1), (50, 1), (51, 1), (52, 1), (53, 1), (54, 1), (55, 1), (56, 1), (57, 1)]
    


```python
# Let's see what are these words
for word in corpus[0]:
    print(id2word[word[0]], word[1])
```

    addition 1
    anyone 2
    body 1
    bricklin 1
    brought 1
    bumper 1
    called 1
    car 5
    college 1
    could 1
    day 1
    door 1
    doors 1
    early 1
    edu 1
    engine 1
    enlighten 1
    front 1
    funky 1
    history 1
    host 1
    il 1
    info 1
    know 1
    late 1
    lerxst 1
    lines 1
    looked 1
    looking 1
    made 1
    mail 1
    maryland 1
    model 1
    name 1
    neighborhood 1
    nntp_posting 1
    organization 1
    park 1
    please 1
    production 1
    rac 1
    really 1
    rest 1
    saw 1
    separate 1
    small 1
    specs 1
    sports 1
    subject 1
    tellme 1
    thanks 1
    thing 1
    umd 1
    university 1
    wam 1
    whatever 1
    wondering 1
    years 1
    


```python
# Build the topic model
lda_model = gensim.models.ldamodel.LdaModel(corpus=corpus,
                                           id2word=id2word,
                                           num_topics=20, # specify the number of topics
                                           random_state=100, # set a random seed so that each output will be the same
                                           update_every=1, # determine how often the model parameters should be updated
                                           chunksize=100, # number of documents to be used in each training chunk
                                           passes=10, # total number of training passes
                                           per_word_topics=True)
```

# Analyzing the results


```python
# Print the keywords in the topics
for topics in lda_model.print_topics():
    print(topics)
```

    (0, '0.029*"death" + 0.026*"moral" + 0.016*"morality" + 0.015*"punishment" + 0.014*"criminal" + 0.012*"trial" + 0.012*"uk" + 0.011*"fair" + 0.011*"al" + 0.010*"islam"')
    (1, '0.022*"software" + 0.020*"mb" + 0.018*"dos" + 0.018*"files" + 0.017*"system" + 0.017*"disk" + 0.015*"windows" + 0.014*"pc" + 0.013*"memory" + 0.013*"mac"')
    (2, '0.012*"health" + 0.011*"april" + 0.010*"department" + 0.009*"happened" + 0.009*"years" + 0.009*"key" + 0.008*"president" + 0.008*"context" + 0.007*"information" + 0.007*"national"')
    (3, '0.032*"lines" + 0.031*"subject" + 0.030*"organization" + 0.027*"nntp_posting" + 0.026*"host" + 0.025*"matthew" + 0.019*"edu" + 0.012*"university" + 0.012*"david" + 0.011*"sale"')
    (4, '0.018*"would" + 0.014*"one" + 0.013*"writes" + 0.012*"subject" + 0.012*"article" + 0.012*"lines" + 0.011*"people" + 0.011*"like" + 0.011*"organization" + 0.009*"know"')
    (5, '0.021*"january" + 0.018*"ps" + 0.013*"mailing_list" + 0.009*"hole" + 0.008*"motorcycle" + 0.007*"cd_rom" + 0.007*"ericsson" + 0.006*"trick" + 0.005*"hammer" + 0.004*"integer"')
    (6, '0.046*"pp" + 0.025*"season" + 0.024*"pittsburgh" + 0.020*"buffalo" + 0.018*"nhl" + 0.017*"lemieux" + 0.015*"chicago" + 0.014*"player" + 0.013*"boston" + 0.012*"first"')
    (7, '0.017*"self" + 0.016*"thanks_advance" + 0.012*"printer" + 0.012*"added" + 0.011*"flight" + 0.010*"electric" + 0.010*"installing" + 0.009*"bell" + 0.009*"hm" + 0.009*"labs"')
    (8, '0.025*"please" + 0.015*"subject" + 0.015*"organization" + 0.014*"lines" + 0.014*"mail" + 0.013*"windows" + 0.011*"program" + 0.011*"university" + 0.009*"help" + 0.009*"thanks"')
    (9, '0.011*"rings" + 0.006*"precisely" + 0.005*"signing" + 0.005*"adding" + 0.004*"starters" + 0.003*"stadium" + 0.002*"yankee" + 0.002*"seldom" + 0.001*"toll" + 0.001*"lefthanded"')
    (10, '0.023*"tape" + 0.020*"percent" + 0.009*"angle" + 0.009*"band" + 0.005*"japan" + 0.003*"fm" + 0.003*"mccarthy" + 0.000*"weaver" + 0.000*"photo_radar" + 0.000*"gm"')
    (11, '0.000*"zg" + 0.000*"zfxz" + 0.000*"zjm" + 0.000*"zjk" + 0.000*"zj" + 0.000*"zilos" + 0.000*"zhd" + 0.000*"zh" + 0.000*"zgp" + 0.000*"zgos"')
    (12, '0.013*"organization" + 0.013*"lines" + 0.013*"subject" + 0.012*"article" + 0.010*"writes" + 0.009*"government" + 0.009*"year" + 0.009*"car" + 0.009*"game" + 0.008*"host"')
    (13, '0.020*"physical" + 0.018*"comp" + 0.014*"direct" + 0.011*"ho" + 0.009*"kit" + 0.008*"york" + 0.006*"sys" + 0.006*"adam" + 0.006*"genesis" + 0.004*"beings"')
    (14, '0.022*"andrew" + 0.020*"cable" + 0.013*"reserve" + 0.012*"modem" + 0.011*"hp" + 0.011*"hewlett_packard" + 0.010*"case_western" + 0.010*"strip" + 0.010*"wa" + 0.010*"nj"')
    (15, '0.034*"armenians" + 0.025*"armenian" + 0.022*"people" + 0.020*"turkish" + 0.019*"greek" + 0.014*"serdar_argic" + 0.014*"murder" + 0.014*"genocide" + 0.013*"government" + 0.011*"killed"')
    (16, '0.050*"israel" + 0.034*"jews" + 0.023*"land" + 0.016*"united_states" + 0.014*"committee" + 0.014*"israeli" + 0.013*"died" + 0.012*"brother" + 0.011*"attacks" + 0.011*"peace"')
    (17, '0.041*"jesus" + 0.030*"god" + 0.014*"christian" + 0.010*"may" + 0.010*"argument" + 0.009*"father" + 0.009*"bible" + 0.008*"certainly" + 0.008*"faith" + 0.008*"example"')
    (18, '0.022*"max" + 0.012*"science" + 0.011*"dr" + 0.009*"passage" + 0.009*"values" + 0.009*"mother" + 0.008*"christ" + 0.008*"family" + 0.007*"manual" + 0.007*"fbi"')
    (19, '0.053*"space" + 0.043*"nasa" + 0.015*"moon" + 0.014*"launch" + 0.013*"shuttle" + 0.012*"objective" + 0.010*"mission" + 0.008*"orbit" + 0.007*"possibility" + 0.007*"apollo"')
    

Topic 0 is a represented as 0.029*"death" + 0.026*"moral" + 0.016*"morality" + 0.015*"punishment" + 0.014*"criminal" + 0.012*"trial" + 0.012*"uk" + 0.011*"fair" + 0.011*"al" + 0.010*"islam". It means the top 10 keywords that contribute to this topic are: "death", "moral", "morality", etc., and the weight of "death" on topic 0 is 0.029. The weights reflect how important a keyword is to that topic. So it is reasonable to summarize the topic as "religion".

# Task 2

Summarize two additional topics (excluding topic 0) based on the top words in the topic (see output above). Analyze the common theme or subject that these topics convey through the frequent use of these top words. Include both your summarization (a single word or phrase) for these two topics and your rationale for the chosen summarization.




```python
# Compute model coherence score, which measures how good a given topic model is
coherence_model_lda = CoherenceModel(model=lda_model, texts=data_words_bigrams, dictionary=id2word, coherence='c_v')
coherence_lda = coherence_model_lda.get_coherence()
print("Coherence LDA score:", coherence_lda)
```

# Task 3

Rebuild the topic model using a chunksize of 50 and 5 passes. Then print the topics generated by this updated model, and compute the new Coherence LDA score.
<br> How has this new model affected the composition of the top words in topic 0, and do you find the top words in topic 0 in the old or the new model to be more coherent? Has the new Coherence LDA score increased or decreased compared with the original score, and what implications can be drawn from this change? Discuss the connection between the change in the Coherence LDA score and the changes in chunksize and passes.
<br>Include your codes in the following cell (code) and the discussion in the next cell (markdown).


```python
lda_model_new = gensim.models.ldamodel.LdaModel(corpus=corpus,
                                           id2word=id2word,
                                           num_topics=20, # specify the number of topics
                                           random_state=100, # setting a random seed so that each output will be the same
                                           update_every=1, # determines how often the model parameters should be updated
                                           chunksize=50, # number of documents to be used in each training chunk
                                           passes=5, # total number of training passes
                                           per_word_topics=True)

for topics in lda_model_new.print_topics():
    print(topics)
    
coherence_model_lda = CoherenceModel(model=lda_model_new, texts=data_words_bigrams, dictionary=id2word, coherence='c_v')
coherence_lda = coherence_model_lda.get_coherence()
print("Coherence LDA score:", coherence_lda)
```




```python
# Finding the dominant topic in each document
count = 0
doc_id_list = []
dominant_topic_list = []
dominant_topic_weight = []
keywords_list = []
text_list = []
for doc in corpus:
    doc_id_list.append(count) # id of the document
    doc_topics = lda_model.get_document_topics(doc) # getting the distribution of topics
    doc_topics = sorted(doc_topics, key=lambda x: x[1], reverse=True) # sorting the topics
    dominant_topic_list.append(doc_topics[0][0]) # getting the most important topic's id
    dominant_topic_weight.append(doc_topics[0][1]) # getting the most important topic's weight
    topic_keywords = []
    for keyword in lda_model.show_topic(doc_topics[0][0]): # each keyword in that topic
        topic_keywords.append(keyword[0]) # adding each keyword to the topic keyword list
    keywords_list.append(topic_keywords)
    text_list.append(df.content.values.tolist()[count]) # getting the full text of the document
    count += 1
dominant_topic_df = pd.DataFrame({'Document ID': doc_id_list, 'Dominant Topic': dominant_topic_list,
                                 'Dominant Topic Weight': dominant_topic_weight, 'Keywords': keywords_list,
                                 'Text': text_list})
dominant_topic_df
```

# Task 4

Print the keywords of the document with index 51, along with the text of the document.
<br>Provide a summary of the topic based on these keywords (in a single word or phrase). After reading the text, discuss whether the dominant topic truly reflects the main subject matter discussed in this document.
<br>Include your codes in the following cell (code) and the discussion in the next cell (markdown).


```python
print(dominant_topic_df['Keywords'][51])
print(dominant_topic_df['Text'][51])
```




```python
# Finding the most dominant document in each topic
topic_id_list = list(range(20)) # a list of topic IDs from 0 to 20
highest_weight_list = [0] * 20 # a list with 20 "0"s, will be replaced with larger values
highest_weight_document = [0] * 20
keywords_list = [0] * 20
text_list = [0] * 20
count = 0
for doc in corpus:
    doc_topics = lda_model.get_document_topics(doc) # getting the distribution of topics
    for topic in doc_topics:
        # for each topic, if the topic weight is larger than the current largest weight of that topic
        if topic[1] > highest_weight_list[topic[0]]:
            highest_weight_list[topic[0]] = topic[1] # update that value to this topic weight
            highest_weight_document[topic[0]] = count 
            # update the ID of the most dominant document of that topic to the ID of current document
            topic_keywords = []
            for keyword in lda_model.show_topic(topic[0]):
                topic_keywords.append(keyword[0])
            keywords_list[topic[0]] = topic_keywords # update the keywords to the keywords of current topic
            text_list[topic[0]] = df.content.values.tolist()[count] # update the text to the text of current document
    count += 1
dominant_document_df = pd.DataFrame({'Topic ID': topic_id_list, 'Keywords': keywords_list, 
                                     'Dominant Document': highest_weight_document, 
                                     'Dominant Document Weight': highest_weight_list, 
                                     'Text': text_list})
dominant_document_df
```

# Task 5

Based on what we have learned about topic modeling, can you suggest potential applications for this method? Please provide an example from either academic research or real-life situations and explain the advantages that topic modeling could offer in that context.




```python

```


```python

```
