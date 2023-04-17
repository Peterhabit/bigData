install.packages("treemap")
library(treemap)
data(GNI2014)
head(GNI2014)
treemap(GNI2014,
        index = c("continent", "iso3"),
        vSize = "population",
        title = "세계인구")