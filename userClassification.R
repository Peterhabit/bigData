# 로지스틱 회귀모델을 이용한 사용자 분류
# 데이터 준비
Fcjs <- read.csv("favoriteC.csv", header = TRUE)    # CSV파일을 [F약자]의 이름으로 저장  		
head(Fcjs)
FCcjs <- Fcjs[, 3:8] 							#3열에서 8열까지 선택하여 저장
FCcjs

# 회귀모델 도출
modcjs <- glm(cluster ~Hamburger+Pizza+Cat+Dog+Summer, data= FCcjs) # 로지스틱 회귀모델 도출
modcjs   	 	    # 회귀모델의 상세 내용 확인

# 로지스틱 회귀모델을 이용한 예측을 위한 새로운 사용자 생성
# 예측 대상 데이터 생성(데이터프레임)
ksj <- data.frame(rbind(c(7, 6, 5, 10, 8)))		# 고수정 교수님 설문 결과
ksj
names(ksj) <- names(FCcjs)[1:5]			 # 새로운 데이터에 변수이름 부여
ksj 							           	 # 예측 대상 데이터

# 로지스틱 회귀모델을 이용한 새로운 데이터 군집 예측
# 새로운 데이터
pred <- predict(modcjs , ksj) 			          # 고수정 교수님 군집 예측
pred 								# 예측 결과 출력
round(pred,0) 						# 예측 결과 출력(소수 첫째 자리에서 반올림)
#3.011273을 반올림하면 3                                                                 
ksj$cluster <- round(pred,0)                 	#ksj의 cluster에 예측 결과 대입
ksj
# 3번째 군집으로 분류

