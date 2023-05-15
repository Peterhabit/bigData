#데이터 호출&k-평균 군집 실시
clcjs <- read.csv("csv_exam.csv",header = TRUE) # 데이터 셋 불러오기

cl_kmccjs <- kmeans(x= clcjs[,3:5],centers =  3)
                     # 3개의 과목에 대해 k-means 군집 실시, k=3
cl_kmccjs
cl_kmccjs$cluster # 각 학생의 군집번호
cl_kmccjs$centers  # 각 군집의 중심


clcjs$cluster <- cl_kmccjs$cluster # 군집번호를 기존 데이터 셋에 추가
head(clcjs)

# k-평균 군집 결과 확인
library(cluster)
# clusplot 함수를 이용해 더 보기 쉽게 군집 표현
clusplot(clcjs, clcjs$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)

#  k-최근접 이웃 분류
library(class)
# [cl약자]훈련용 데이터와 테스트용 데이터 준비
tr.idx <- c( 1:15 ) # 1~15행까지 훈련용 데이터의 인덱스
ds.tr <- clcjs[tr.idx, 3:5] # 훈련용 데이터셋(math, English, science)
ds.ts <- clcjs[-tr.idx, 3:5] # 테스트용 데이터셋 (math, English, science)
cl.tr <- factor(clcjs[tr.idx, 6]) # 훈련용 데이터셋의 그룹 정보
cl.ts <- clcjs[-tr.idx, 6] # 테스트용 데이터셋의 그룹 정보
predcjs <- knn(ds.tr, ds.ts, cl.tr, k=3, prob=TRUE) #k-최근접 이웃 분류
predcjs #16번부터 20번까지의 군집 번호
Acc <- mean(predcjs==cl.ts) # 예측 정확도를 구함
Acc # 예측 정확도는 0.8
table(predcjs,cl.ts) # 예측값과 실제값 비교 통계
