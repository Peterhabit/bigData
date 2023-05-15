favoritecsvcjs <- read.csv("2023_favorite.csv", header = TRUE) # 데이터 셋 불러오기

favoritecjs <- kmeans(x=favoritecsvcjs, centers = 3) # k-means 군집 실시, k=3
favoritecjs
favoritecjs$cluster # 각 학생의 군집번호
favoritecjs$centers  # 각 군집의 중심

favoritecsvcjs$cluster <- favoritecjs$cluster # 군집번호를 기존 데이터 셋에 추가
head(clcjs)

library(cluster)

clusplot(favoritecsvcjs, favoritecsvcjs$cluster, color=TRUE,
         shade=FALSE,labels=2, lines=0)


library(class)
# 훈련용 데이터와 테스트용 데이터 준비
tr.idx <- c(1:20) # 1~20행까지 훈련용 데이터의 인덱스
ds.tr <- favoritecsvcjs[tr.idx, 3:7] # 훈련용 데이터셋
ds.ts <- favoritecsvcjs[-tr.idx, 3:7] # 나머지는 테스트용 데이터셋
cl.tr <- factor(favoritecsvcjs[ tr.idx, 8  ] ) # 훈련용 데이터셋의 그룹 정보
cl.ts <- factor(favoritecsvcjs[- tr.idx, 8 ]) # 테스트용 데이터셋의 그룹 정보
predfavoritecjs <- knn(ds.tr, ds.ts, cl.tr, k=3, prob=TRUE)
predfavoritecjs
Acc <- mean(predfavoritecjs==cl.ts) # 예측 정확도
Acc
table(predfavoritecjs,cl.ts) 