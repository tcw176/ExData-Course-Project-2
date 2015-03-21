## Plot 1

library(plyr)
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(filename = "plot1.png")

PolTot <- group_by(NEI, year)
SumPol <- summarise(PolTot, EmissionTotal = sum(Emissions))
plot(SumPol$year, SumPol$EmissionTotal, xlab ="Year", ylab = "Emission Total")
model <- lm(EmissionTotal ~ year, SumPol)
abline(model, lw = 2)
title(main = "Total PM 2.5 Emissions from All Sources")
legend("topright", legend = c("Emission Total", "Line of Best Fit"), pch = c(1,NA), lwd = c(NA,2))

dev.off()
