#==================================================
# 2. 기계학습 적용해보기
#==================================================
#working directory
getwd()

#아래 경로에는 여러분의 작업 디렉토리 경로를 넣으세요.
setwd("C:/Users/user/Desktop/1일차")

titanic.1 <- read.csv("titanic.1.csv", header = T)
head(titanic.1)
str(titanic.1)

titanic.1$Survived <- as.factor(titanic.1$Survived)
titanic.1$Pclass <- as.factor(titanic.1$Pclass)


# 2.1 데이터셋 나누기 ---------------------------------------------------------

#Sampling Indexes

set.seed(2017)
indexes <- sample(1:nrow(titanic.1), size=0.2*nrow(titanic.1))

# Split data
test <- titanic.1[indexes,]
train <- titanic.1[-indexes,]


# 2.2 머신러닝 알고리즘 : 로지스틱회귀 ---------------------------------------------
save.image("titanic1.RData")

#모델생성
train.glm.1 <- glm(Survived ~ Sex + Pclass + Age + SibSp
                   , family = binomial
                   , data = train)

#예측
head(test)

fit.results.1 <- predict(train.glm.1, newdata=test[,-2], type='response')

fit.results.1

# cut-off value = .5로 잘라보자.
fit.results.1.5 <- ifelse(fit.results.1 >= 0.5,1,0)

fit.results.1.5

# 2.3 검증 ---------------------------------------------

table(test$Survived)
table(test$Survived,fit.results.1.5 )
