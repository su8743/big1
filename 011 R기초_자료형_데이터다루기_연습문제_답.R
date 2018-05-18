rm(list = ls())

##################################################################################
# 연습문제1 ----------------------------------------------------------------
##################################################################################

#1. 1부터 10까지, 0.5씩 증가시킨 값들로 구성된 벡터를 변수에 저장하시오.
a <- seq(1,10,.5)
a
#2. 벡터의 평균, 표준편차를 구하시오
# 평균 : mean(), 표준편차 sd()
mean(a); sd(a)

# airquality 데이터셋은 뉴욕의 공기오염도를 측정한 결과입니다.
?

#3. airquality 데이터셋의 도움말을 조회해보세요.
?airquality

#4. airquality의 각 변수의 데이터타입을 확인하시오.
str(airquality)

#5. airquality 데이터셋의 첫 6번째 행까지를 조회하시오.
head(airquality)

#6. 평균 오존농도(Ozone)를 구하시오.
mean(airquality$Ozone, na.rm = T)
?mean


#7. 8월20일의 측정치를 조회하시오.
airquality[112,]

airquality$Month == 8 & airquality$Day == 20
airquality[airquality$Month == 8 & airquality$Day == 20,]

#8. 온도가 가장 높은 날의 측정치를 조회하시오.
maxTemp <- max(airquality$Temp);maxTemp
airquality$Temp == maxTemp
airquality[airquality$Temp == maxTemp, ]

#9. 9월 평균온도와 바람의세기의 표준편차를 구하시오.
airquality[airquality$Month == 9, "Temp"]
airquality[airquality$Month == 9, 4]
airquality[airquality$Month == 9, ]$Temp
mean(airquality[airquality$Month == 9, ]$Temp)

sd(airquality[airquality$Month == 9, "Wind"])
#10. airquality 데이터 셋을 air2 이름으로 복사하시오.
air2 <- airquality

#11. air2 각 칼럼별로 NA가 몇개씩 있는지 찾으시오.
colSums(is.na(air2))

#12. Solar.R 중 NA값을 0으로 지정하시오.
air2[is.na(air2$Solar.R),"Solar.R"] <- 0
air2[air2$Solar.R ==0,]
