library(tidyverse)
library(rvest)

# this is the url we're going to load.
url <- "https://foodland.ca/store-locator/"

# read the website's html into a variable called 'html'
html <- rvest::read_html(url)

html

# extract the html sections for the individual stores using the css selector
# we found using SelectorGadget
stores <- rvest::html_elements(html,
                               css = ".brand-foodland-store-location")

# for demonstration, put the first store into a separate variable.
store <- stores[[1]]

# print summary results to the console.
store

# some data is stored as invisible attributes, which we can extract
# with html_attr():
rvest::html_attr(store, "data-lat")
rvest::html_attr(store, "data-lng")

# some data is presented only as human-readable text, but we can extract it
# using CSS selectors that we find again with SelectorGadget.
# we use html_elements() to get the html, then html_text() to get the text.

# here we get the city:
rvest::html_elements(store, css = ".city") %>% rvest::html_text()

# and here we get the province:
rvest::html_elements(store, css = ".province") %>% rvest::html_text()
