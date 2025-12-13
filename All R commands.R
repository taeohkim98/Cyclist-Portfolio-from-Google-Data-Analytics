#For Creating usertype vs. count
install.packages("ggplot2")
library(ggplot2)
ggplot(data=tdvsut) + geom_bar(mapping=aes(x=usertype))

#For Creating Birth Year Distribution by Rider Type (With Citing Median)
install.packages("tidyverse")
library(tidyverse)

medianCalcCasual <- utvsby %>%
  filter(usertype=="casual") %>%
  pull(birthyear) %>%
  median(na.rm = TRUE)
medianCasualStatement <- paste("Median Birthyear of Casual:",medianCalcCasual)

medianCalcMember <- utvsby %>%
  filter(usertype=="member") %>%
  pull(birthyear) %>%
  median(na.rm = TRUE)
medianMemberStatement <- paste("Median Birthyear of Member:",medianCalcMember)

ggplot(data=utvsby) + 
  geom_bar(mapping=aes(x=birthyear, fill = usertype)) + 
  facet_wrap(~usertype, scales="free_y") +
  labs(title="Birth Year Disribution by Rider Type", 
       caption=(paste(medianCasualStatement, medianMemberStatement,sep = "  |  ")))
