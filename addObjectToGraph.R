# ggplot2 패키지 로드 및 economics 데이터 세트 구조 확인하기
library(ggplot2)
str(economics)

# 그래프에 사선 그리기
ggplot(economics, aes(x = date, y = psavert)) +
  geom_line() +
  geom_abline(intercept = 12.18671, slope = -0.0005444)

# 그래프에 평행선 그리기
ggplot(economics, aes(x = date, y = psavert)) +
  geom_line() +
  geom_hline(yintercept = mean(economics$psavert))

# 그래프에 텍스트 입력하기
ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_point() +
  geom_text(aes(label = Temp, vjust = 0, hjust = 0))

# 그래프에 사각형 그리기
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  annotate("rect", xmin = 3, xmax = 4, ymin = 12, ymax = 21, alpha= 0.1, fill = "skyblue")

# 그래프에 화살표 그리기
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  annotate("rect", xmin = 3, xmax = 4, ymin = 12, ymax = 21, alpha = 0.5, fill = "skyblue") +
  annotate("segment", x = 2.5, xend = 3.7, y = 10, yend = 17, color = "red", arrow = arrow()) + 
  annotate("text", x = 2.5, y = 10, label = "point")
