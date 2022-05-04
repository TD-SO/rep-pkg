library(extrafont)
library(readr)
library(ggplot2)
library(tidyr)
library(dplyr)
library(scales)



loadfonts()

df <- read.table("../rawData/sentiment.csv", sep=",", header=T)

# Reshape data from column-based to row-based
df.m <- reshape2::melt(df, id.vars = NULL)

# Define custom labels for plot
sentiments <- c("Negative", "Neutral", "Positive")

p = ggplot(df.m, aes(x = variable, y = value)) +
  geom_violin(fill = "grey65") +
  theme_bw() +
  labs(x = "Sentiment",
       y = "Sentiment Score") +
  # Add custom labels
  scale_x_discrete(labels=sentiments) +
  geom_boxplot(width=0.2, fill="white", outlier.shape = NA)+
  # General theme follows
  theme(legend.position="none",
       axis.ticks.y=element_blank(),
       axis.ticks.x=element_blank(),
       text = element_text(size = 15, family = 'serif',),
       axis.title.x = element_text(margin = unit(c(10, 0, 0, 0), "pt")),
       axis.title.y = element_text(margin = unit(c(0, 10, 0, 0), "pt")),
       panel.grid.major.y = element_line(colour = 'gray85'),
       panel.grid.minor.y = element_line(colour = 'gray85'),
       panel.background = element_rect(colour = "white"),
       panel.border = element_blank(),
       axis.line.x = element_line(),
       panel.grid.major.x = element_blank()
  )


compound_sentiment <- read.table("../rawData/compound.csv", sep=",", header=T)

# Reshape data from column-based to row-based
compound_sentiment.m <- reshape2::melt(compound_sentiment, id.vars = NULL)

p = ggplot(compound_sentiment.m, aes(x = "", y = value)) +
  geom_violin(fill = "grey65") +
  theme_bw() +
  labs(x = "",
       y = "Compound Sentiment Score") +
  # Align horizontally
  coord_flip() +
  # Define custom scale
  scale_y_continuous(breaks=seq(-1,1,0.25)) +
  geom_boxplot(width=0.2, fill="white", outlier.shape = NA)+
  # General theme follows
  theme(legend.position="none",
        axis.ticks.y=element_blank(),
        axis.ticks.x=element_blank(),
        text = element_text(size = 15, family = 'serif',),
        axis.title.x = element_text(margin = unit(c(10, 0, 0, 0), "pt")),
        axis.title.y = element_text(margin = unit(c(0, 10, 0, 0), "pt")),
        panel.grid.major.y = element_line(colour = 'gray85'),
        panel.grid.minor.y = element_line(colour = 'gray85'),
        panel.background = element_rect(colour = "white"),
        panel.border = element_blank(),
        axis.line.x = element_line(),
        panel.grid.minor.x = element_line(colour = 'white')
  )

print(p)

lenght <- read.table("../rawData/lenght.csv", sep=",", header=T)

tdtypes <- c("Architecture", "Build", "Code", "Design", "Documentation", "Infrastructure", "Requirements", "Test", "Versioning")

# Identify and remove lenght outliers
outliers <- boxplot(lenght$BodyLenght, plot=FALSE)$out
lenght <- lenght[-which(lenght$BodyLenght %in% outliers),]


t = ggplot(lenght, aes(x = TDTYPE, y = BodyLenght)) +
  geom_violin(fill = "grey65") +
  theme_bw() +
  labs(x = "Technical debt type",
       y = "Question Lenght (# words)") +
  geom_boxplot(width=0.2, fill="white", outlier.shape = NA)+
  scale_x_discrete(labels=tdtypes) +
  scale_y_continuous(breaks=seq(0,430,50)) +
  theme(legend.position="none",
        axis.ticks.y=element_blank(),
        axis.ticks.x=element_blank(),
        text = element_text(size = 22, family = 'serif',),
        axis.title.x = element_text(margin = unit(c(10, 0, 0, 0), "pt")),
        axis.text.x = element_text(angle = 45, vjust = 1, hjust=1),
        axis.title.y = element_text(margin = unit(c(0, 10, 0, 0), "pt")),
        panel.grid.major.y = element_line(colour = 'gray85'), 
        panel.grid.minor.y = element_line(colour = 'gray85'), 
        panel.background = element_rect(colour = "white"),
        panel.border = element_blank(), 
        axis.line.x = element_line(),
        panel.grid.major.x = element_blank()
  )

print(t)
