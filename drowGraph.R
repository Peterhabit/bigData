# ggplot2 패키지 설치 및 로드하기
install.packages("ggplot2")
library(ggplot2)

# 그래프 기본 틀 생성하기
str(airquality)
ggplot(airquality, aes(x = Day, y = Temp))

# 산점도 그리기
ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_point()

# 산점도 점 크기와 색상 변경하기
ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_point(size = 3, color = "red")

# 선 그래프 그리기
ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_line()

# 막대 그래프 그리기
ggplot(mtcars, aes(x = cyl)) +
  geom_bar(width = 0.5)

# x축의 값이 없는 범주 제외하고 그래프 그리기
ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(width = 0.5)

# 누적 막대 그래프 그리기
ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(aes(fill = factor(gear)))

# 선버스트 차트 그리기
ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(aes(fill = factor(gear))) +
  coord_polar()

# 도넛 모양의 선버스트 차트 그리기
ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(aes(fill = factor(gear))) +
  coord_polar(theta = "y")

# 상자 그림 그리기
ggplot(airquality, aes(x = Day, y = Temp, group = Day)) +
  geom_boxplot()

# 히스토그램 그리기
ggplot(airquality, aes(Temp)) +
  geom_histogram()

# 막대 크기를 변경
ggplot(airquality, aes(Temp)) +
  geom_histogram(binwidth = 5)