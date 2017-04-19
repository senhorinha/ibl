source('dependencies.R')

loop = function (trainingDataset, dc, correctClassifications = 0, incorrectClassifications = 0) {
  rowsSize = dim(trainingDataset)[1]
  clazzIndex = dim(trainingDataset)[2]
  distanceCalculator = EuclideanDistanceCalculator$new()
  for(i in 1:rowsSize) {
    classifier = NearestNeighbourClassifier$new(distanceCalculator, dc)
    trainingPoint = trainingDataset[i,]
    values = trainingPoint[seq(1, (clazzIndex - 1))]

    oldClazz = trainingPoint[clazzIndex]
    newClazz = classifier$classify(values)
    dc = rbind(dc, trainingPoint)
    if(newClazz == oldClazz) {
      correctClassifications = correctClassifications + 1
    } else {
      incorrectClassifications = incorrectClassifications + 1
    }
  }

  list('dc' = dc, 'correctClassifications' = correctClassifications, 'incorrectClassifications' = incorrectClassifications)
}

initialDataset = IrisDataset$new() # Available datasets: IrisDataset$new(), CarsDataset$new(), CancerDataset$new(), DoubleSpiral$new(), BankTwoDimensionsDataset$new()
iblUtil = IblUtil$new()
datasets = iblUtil$divideDatasetIntoUpperBottomAndDc(initialDataset);
upperHalfOfDataset = datasets$upperHalf
bottomHalfOfDataset = datasets$bottom
dc = datasets$dc

firstTrainingResult = loop(upperHalfOfDataset, dc)
finalTrainingResult = loop(
  bottomHalfOfDataset,
  firstTrainingResult$dc,
  firstTrainingResult$correctClassifications,
  firstTrainingResult$incorrectClassifications
)

iblUtil$printResult(finalTrainingResult);
iblUtil$plotGraph(finalTrainingResult$dc);
