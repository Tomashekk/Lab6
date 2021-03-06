library(openair)
pete.ratts<-read.csv("PR_LocalMet_10m.csv")
evansville<-read.csv("EVV10mMET_11103.csv")
wind.df<-data.frame(month=pete.ratts$Month, day=pete.ratts$JulianDay,
                   pr.ws=pete.ratts$WindSpeed, pr.wd=pete.ratts$WindDirection,
                   ev.ws=evansville$WindSpeed, ev.wd=evansville$WindDirection)
wR <- function(range, site){
  ws <- wind.df[wind.df$day %in% seq(range[1], range[2]), paste0(site, ".ws")]
  wd <- wind.df[wind.df$day %in% seq(range[1], range[2]), paste0(site, ".wd")]
  w.df <- data.frame(ws,wd)
  windRose(w.df,ws="ws",wd="wd",grid.line=5,annotate=FALSE,
             key.position="right",offset=3, breaks=5,paddle=FALSE,
             key.footer="Wind Speed")
}
shinyServer(function(input, output) {
  output$Plot <- renderPlot({
    wR(range = input$range, site = input$site)
    })
})