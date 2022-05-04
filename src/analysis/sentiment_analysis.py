import pandas as pd
import os
import csv
from nltk.sentiment.vader import SentimentIntensityAnalyzer

df = pd.read_csv('../../data/dataset.csv', sep=',')


if not os.path.exists('../../data/sentiment.csv'):
    with open('../../data/sentiment.csv', 'w'): pass

output = open('../../data/sentiment.csv')

df = df[df.columns[2]]

sia = SentimentIntensityAnalyzer()

empty_dict = dict.fromkeys(['NegativeS','NeutralS','PositiveS','CompoundS'])

with open('../../data/sentiment.csv','w') as output:
    writer=csv.writer(output, delimiter=',',lineterminator='\n',)
    for index, row in df.items():
        element = sia.polarity_scores(row)
        row_output = [*element.values()]
        writer.writerow(row_output)