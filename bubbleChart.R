st<-state.x77[1:15,c(1,3,5)]
st1<-data.frame(st)
symbols(st1$Illiteracy, st1$Murder, circles = st1$Population,
        xlab = "문맹률",
        ylab = "범죄율",
        main = "문맹과 범죄")