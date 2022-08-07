library(readr)

# Parse strings - encodings----
s1 <- "El Ni\xf1o was particularly bad this year"
s2 <- "\x82\xb1\x82\xf1\x82\xc9\x82\xbf\x82\xcd"

print(parse_character(s1, locale = locale(encoding = "ISO-8859-1"))) # Western Europe
print(parse_character(s2, locale = locale(encoding = "SHIFT-JIS"))) # Japanese
print("こんにちは")
cat("\n")


# Parse factors ----
fruits <- c("apple", "banana")
raw <- c("apple", "banana", "bannana")
res <- parse_factor(raw, levels = fruits)