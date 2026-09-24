library(querychat)
library(shiny)
library(bslib)

con = DBI::dbConnect(RSQLite::SQLite(), "data/midwest_airbnb.db")

client = ellmer::chat_openai(
  model  = "gpt-5.6-luna",
  params = ellmer::params(reasoning_effort = "none")
)

qc = querychat::querychat(
  con, "listings",
  client             = client,
  tools              = c("filter", "query", "visualize"),
  greeting           = "Ask me about 14,887 Airbnb listings in Chicago, Columbus, and the Twin Cities.",
  data_description   = "data/data_desc.md",
  extra_instructions = "data/extra_instructions.md"
)

ui = page_sidebar(
  title   = "Midwest Airbnb Explorer",
  theme   = bs_theme(primary = "#C3142D",
                     base_font = font_google("Lato")),
  sidebar = qc$sidebar(width = 350),
  card(card_header(textOutput("title")),
       DT::DTOutput("table")),
  accordion(open = "SQL",
            accordion_panel("SQL", verbatimTextOutput("sql")),
            accordion_panel("About", "This app explores 14,887 Airbnb listings across Chicago, Columbus, and the Twin Cities using data from Inside Airbnb's July 2026 snapshot. Built by Thurman Schreel."))
)

server = function(input, output, session) {
  vals = qc$server()
  output$title = renderText(vals$title() %||% "All Airbnb Listings")
  output$table = DT::renderDT(vals$df(),
                              options = list(pageLength = 10))
  output$sql   = renderText(vals$sql() %||%
                              "SELECT * FROM listings")
}

shinyApp(ui, server)



