box::use(
  shiny[h1, bootstrapPage, div, moduleServer, NS, tags, icon],
)

box::use(
  app/view/chart,
  app/view/table,
)



#' @export
ui <- function(id) {
  ns <- NS(id)
  
  bootstrapPage(
    h1("RhinoApplication"),
    div(
      class = "components-container",
      table$ui(ns("table")),
      chart$ui(ns("chart")) 
    ),
    tags$button(
      id = "help-button",
      icon("question")
    )
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    data <- rhino::rhinos
    
    table$server("table", data = data)
    chart$server("chart", data = data)
  })
}