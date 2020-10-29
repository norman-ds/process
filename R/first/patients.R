# create a process map of hospital patients
library(bupaR)

# get dataset
pats <- eventdataR::patients
pats$handling %>% levels()

# define translation of activities
(trans <- jsonlite::fromJSON('
{
  "languages": ["en", "de"],
  "translation": [
    {
      "en": "Blood test",
      "de": "Bluttest"
    },
    {
      "en": "Check-out",
      "de": "Entlassung"
    },
    {
      "en": "Discuss Results",
      "de": "Ergebnisse besprechen"
    },
    {
      "en": "MRI SCAN",
      "de": "MRI"
    },
    {
      "en": "Registration",
      "de": "Registration"
    },
    {
      "en": "Triage and Assessment",
      "de": "Triage und Beurteilung"
    },
    {
      "en": "X-Ray",
      "de": "Röntgenbild"
    }
  ]
}'))


# translate activities
levels(pats$handling) <- trans$translation$de
levels(pats$handling)

# create process map
process_map(pats, rankdir = "TB", type = frequency("relative_case", "Reds"))

# requires 'DiagrammeRsvg' and 'rsvg' package
process_map(pats, rankdir = "TB", type = frequency("relative_case", "Reds"), render = F) %>%
  DiagrammeR::export_graph("processmap.png", "PNG")

