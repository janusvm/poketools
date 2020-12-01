ui <- dashboardPage(
  skin = "red",
  dashboardHeader(title = "PokeTools"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Speed Tiers", tabName = "speedtiers", icon = icon("dashboard"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem("speedtiers",
        box(title = "Reference Pokémon", width = 4,
          splitLayout(
            numericInput("speedBase", "Base", value = 100, min = 1, max = 255),
            numericInput("speedIV", "IV", value = 31, min = 0, max = 31),
            numericInput("speedEV", "EV", value = 252, min = 0, max = 252, step = 4)
          ),
          splitLayout(
            radioButtons("nature", "Nature", c("Positive", "Neutral", "Negative"),
              selected = "Positive", inline = TRUE),
            sliderInput("speedStage", "Stat stage", value = 0, min = -6, max = 6)
          ),
          splitLayout(
            selectInput("item", "Held item", c("Choice Scarf", "(lost/consumed)", "Other"), "Other",
              selectize = FALSE),
            selectInput("ability", "Ability",
              c("Quick Feet", "Unburden", "(weather boost)", "Other"), "Other", selectize = FALSE)
          ),
          checkboxGroupInput("fieldEffects", "Field Effects", inline = TRUE,
            c("Tailwind", "Trick Room", "Pledge swamp", "Weather"))
        )
      )
    )
  )
)
