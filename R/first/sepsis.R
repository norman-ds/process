library(bupaR)

# get dataset
seps <- eventdataR::sepsis
seps$activity %>% levels()

# define translation of activities
(trans <- jsonlite::fromJSON('
{
  "languages": ["en", "de"],
  "translation": [
    {
      "en": "Admission IC",
      "de": "Aufnahme IPS"
    },
    {
      "en": "Admission NC",
      "_de": "Aufnahme IMC",
      "de": "Aufnahme IPS"
    },
    {
      "en": "CRP",
      "de": "CRP"
    },
    {
      "en": "ER Registration",
      "de": "Notfall Registration"
    },
    {
      "en": "ER Sepsis Triage",
      "de": "Notfall Sepsis Triage"
    },
    {
      "en": "ER Triage",
      "de": "Notfall Triage"
    },
    {
      "en": "IV Antibiotics",
      "de": "IV Antibiotika"
    },
    {
      "en": "IV Liquid",
      "de": "IV Fluid"
    },
    {
      "en": "LacticAcid",
      "de": "Lactat"
    },
    {
      "en": "Leucocytes",
      "de": "Leukozyten"
    },
    {
      "en": "Release A",
      "_de": "Entlassung A",
      "de": "Entlassung"
    },
    {
      "en": "Release B",
      "de": "Entlassung B"
    },
    {
      "en": "Release C",
      "de": "Entlassung C"
    },
    {
      "en": "Release D",
      "de": "Entlassung D"
    },
    {
      "en": "Release E",
      "de": "Entlassung E"
    },
    {
      "en": "Return ER",
      "de": "Wiedereintritt Notfall"
    }
  ]
}'))

# get the abbreviation
abbreviate(trans$translation$en)
abbreviate(trans$translation$de)

# translate activities
levels(seps$activity) <- trans$translation$de
levels(seps$activity)

# create trace_explorer
trace_explorer(seps, n_traces = 15, coverage_labels = c("relative","cumulative"),
               scale_fill = ggplot2::scale_fill_brewer(palette = "Set3"))

png("frequenttraces.png", width = 700, height = 800)
trace_explorer(seps, n_traces = 15, coverage_labels = c("relative","cumulative"),
               scale_fill = ggplot2::scale_fill_brewer(palette = "Set3"))
dev.off()

