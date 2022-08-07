# Two categorical variables
# 1. Show distribution of colors within cuts. group_by cut for dist. of cuts within colors
diamonds %>% count(color, cut) %>% group_by(color) %>% mutate(prop=n/sum(n)) %>% ggplot(aes(color, cut)) + geom_tile(fill=prop)