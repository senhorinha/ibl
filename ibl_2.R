source('dependencies.R')

dataset = IrisDataset$new() # Available datasets: IrisDataset$new(), CarsDataset$new(), CancerDataset$new(), DoubleSpiral$new()
points = dataset$points()
rowsSize = dim(points)[1]
clazzColumnIndex = dim(points)[2]

trainingPointsSize = rowsSize / 2
trainingPoints = head(points, trainingPointsSize)
realPoints = points[(trainingPointsSize+1):rowsSize, ]
dc = list()

classifier = NearestNeighbourClassifier$new(EuclideanDistanceCalculator$new(), realPoints)
correctClassifications = 0
incorrectClassifications = 0

for(i in 1:trainingPointsSize) {
  trainingPoint = trainingPoints[i,]
  values = trainingPoint[seq(1, (clazzColumnIndex - 1))]

  oldClazz = trainingPoint[clazzColumnIndex]
  newClazz = classifier$classify(values)
  if(newClazz == oldClazz) {
    correctClassifications = correctClassifications + 1
  } else {
    incorrectClassifications = incorrectClassifications + 1
    dc[[length(dc) + 1]] = c(values, newClazz)
  }
}

print('--- Trained points ---')
print(dc)

print('--- Summary ---')
print(paste('Correct classifications: ', correctClassifications))
print(paste('Incorrect classifications: ', incorrectClassifications))
