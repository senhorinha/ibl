source('dependencies.R')

loop = function (trainingPoints, dc, correctClassifications = 0, incorrectClassifications = 0) {
  if (length(trainingPoints) > 0) {
    firsPointValues = trainingPoints$values
    rowsSize = dim(firsPointValues)[1]
    clazzIndex = dim(firsPointValues)[2]
    distanceCalculator = EuclideanDistanceCalculator$new()

    for(i in 1:rowsSize) {
      classifier = NearestNeighbourClassifier$new(distanceCalculator, dc)
      trainingPoint = trainingPoints[i]

      classifiedClass = classifier$classify(trainingPoint$getValues())
      if(classifiedClass == trainingPoint$getClass()) {
        correctClassifications = correctClassifications + 1
      } else {
        dc = rbind(dc, trainingPoint)
        incorrectClassifications = incorrectClassifications + 1
      }
     }
  }

  list('dc' = dc, 'correctClassifications' = correctClassifications, 'incorrectClassifications' = incorrectClassifications)
}

initialDataset = IrisDataset$new() # Available datasets: IrisDataset$new(), CarsDataset$new(), CancerDataset$new(), DoubleSpiral$new(), BankTwoDimensionsDataset$new()
iblUtil = IblUtil$new()
points = iblUtil$convertDatasetPointsToIblPoints(initialDataset$points())
datasets = iblUtil$divideDatasetIntoUpperBottomAndDc(initialDataset);
upperHalfPoints = iblUtil$convertDatasetPointsToIblPoints(datasets$upperHalf)
bottomHalfPoints = iblUtil$convertDatasetPointsToIblPoints(datasets$bottomHalf)
dc = datasets$dc

firstTrainingResult = loop(upperHalfPoints, dc)
finalTrainingResult = loop(
  bottomHalfOfDataset,
  firstTrainingResult$dc,
  firstTrainingResult$correctClassifications,
  firstTrainingResult$incorrectClassifications
)

iblUtil$printResult(finalTrainingResult);
iblUtil$plotGraph(finalTrainingResult$dc);
