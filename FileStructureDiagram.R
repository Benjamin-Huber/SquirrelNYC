library(diagram)

names <- c("C://", "project1", "project2", "project3",
           "Analysis", "Output", "Data",
           "Analysis", "Output", "Data",
           "Analysis", "Output", "Data")

M <- matrix(nrow = 13, ncol = 13, byrow = TRUE, data = 0)

M[2, 1] <- M[3, 1] <- M[4, 1] <- ""
M[5, 2] <- M[6, 2] <- M[7, 2] <- ""
M[8, 3] <- M[9, 3] <- M[10, 3] <- ""
M[11, 4] <- M[12, 4] <- M[13, 4] <- ""

plotmat(M, pos = c(1, 3, 9), name = names, lwd = 1,
           box.lwd = 1, cex.txt = 0.8, box.size = 0.05,
           box.type = "square", box.prop = 1)
