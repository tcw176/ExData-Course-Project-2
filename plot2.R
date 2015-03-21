## Plot 2
## install plyr and dplyr packages if not already installed.

library(plyr)
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(filename = "plot2.png")

BaltimorePollution <- filter(NEI, fips == "24510") %>% 
      group_by(year) %>%
      summarise(EmissionTotal = sum(Emissions))

plot(BaltimorePollution$year, BaltimorePollution$EmissionTotal, xlab ="Year", ylab = "Emission Total")
model <- lm(EmissionTotal ~ year, BaltimorePollution)
abline(model, lw = 2)
title(main = "Total PM 2.5 Emissions from All Sources for the City of Baltimore")
legend("topright", legend = c("Emission Total", "Line of Best Fit"), pch = c(1,NA), lwd = c(NA,2))

dev.off()
