# Asking About Technical Debt: Characteristics and Automatic Identification of Technical Debt Questions on Stack Overflow

This repository is a companion page for the following publication:
> Nicholas Kozanidis, Roberto Verdecchia, Emitzá Guzmán. _"Asking About Technical Debt: Characteristics and Automatic Identification of Technical Debt Questions on Stack Overflow"_, 
 16th ACM/IEEE International Symposium on Empirical Software Engineering and Measurement ([ESEM](https://conf.researchr.org/home/esem-2022)). 2022.

The repository contains all material necessary for replicating the study, including the entirety of the data and scripts used.

## How to cite us
The scientific article describing design, execution, and main results of this study is available [here](https://robertoverdecchia.github.io/papers/ESEM_2022.pdf).<br>

If this study is helping your research, consider to cite it is as follows, thanks!

```
@inproceedings{,
  title={{Asking About Technical Debt: Characteristics and Automatic Identification of Technical Debt Questions on Stack Overflow}},
  author={Kozanidis, Nicholas and Verdecchia, Roberto and Guzm\'an, Emitz\'a .},
  inproceedings={16th ACM/IEEE International Symposium on Empirical Software Engineering and Measurement (2022)},
  year={2022},
  publisher={IEEE}
}
```

## Repository Structure
This is the root directory of the repository. The directory is structured as follows:

    .
    ├── data                                            
    │    ├── dataset.csv                             Labelled dataset of Stack Overflow posts
    │    └── inter_rater_reliability_data.csv        Data used to assess inter-rater reliability
    ├── docs
    │ └── labelling_guide.pdf                        Labelling guide
    └── src
        ├── analysis
        │   ├── inter_rater_reliability_analysis.R   Script used to assess inter-rater reliability
        │   ├── sentiment_analysis.py                Script used to execute the sentiment analysis based on VADER
        │   └── violin_plot.R                        Script used to generate the violin plots 
        └── classification
            └── classification_code.ipynb            Jupiter notebook containing the code used to preprocess, train, and test the predictive models 
