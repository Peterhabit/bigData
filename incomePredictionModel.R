#데이터 준비
install.packages("car")
library(car)
head(Prestige)
newdata <- Prestige[,c(1:4)] 				# 회귀식 작성을 위한 데이터 준비
head(newdata)

#산점도
plot(newdata, col="blue")     # 산점도를 통해 변수 간 관계 확인


#다중선형회귀 분석
# 회귀식
mod1 <- lm(income ~ education + prestige + women, data=newdata)
mod1

#다중선형회귀식 구하기
coef(mod1)[1] 					# b 값 출력
coef(mod1)[2] 					# W1 값 출력
coef(mod1)[3] 					# W2 값 출력
coef(mod1)[4] 					# W3 값 출력

#소득 예측
b <- coef(mod1)[1]					#y = 177.2x1+141.4x2-50.9x3 -253.8
W1 <- coef(mod1)[2]			 	#y = 177.2x1+141.4x2-50.9x3 -253.8
W2 <- coef(mod1)[3]			 	#y = 177.2x1+141.4x2-50.9x3 -253.8
W3 <- coef(mod1)[4]			 	#y = 177.2x1+141.4x2-50.9x3 -253.8

education  <- 12 					# 교육정도
prestige <-  63         	# 평판 
women <-  12            #여성 비율           
income<- W1*education + W2*prestige + W3*women + b  # y = 177.2X12 + 141.4X63 - 50.9X12  - 253.8
income				           		# 소득
#교육연수 12, 평판도 63, 여성비율 12일 경우소득은 10172.22이 될 것이다

