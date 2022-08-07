library(tidyverse)
ggplot(diamonds, aes(carat, price)) + geom_hex()
ggsave("diamonds.png")
ggsave("diamonds.pdf")

