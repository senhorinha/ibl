source('dependencies.R')

loop = function (iblUtil, trainingPoints, dc, correctClassifications = 0, incorrectClassifications = 0) {
  if (length(trainingPoints) > 0) {
    distanceCalculator = EuclideanDistanceCalculator$new()
    for(i in 1:length(trainingPoints)) {
      trainingPoint = trainingPoints[[i]]
      values = trainingPoint$getValues()

      # Build similarities and acceptables
      similaritiesAndAcceptables = buildSimilaritiesAndAcceptables(distanceCalculator, dc, values)
      similarities = similaritiesAndAcceptables$similarities
      acceptables = similaritiesAndAcceptables$acceptables

      # Find ymax and ymaxsim
      findResult = findYMax(dc, similarities, acceptables);
      yMax = findResult$point

      # Check classification
      if(yMax$getClass() == trainingPoint$getClass()) {
        correctClassifications = correctClassifications + 1
        trainingPoint$incrementCorrectClassification()
      } else {
        incorrectClassifications = incorrectClassifications + 1
        trainingPoint$incrementIncorrectClassification()
        dc[[length(dc) + 1]] = trainingPoint
      }

      # Refresh indicators
      dc = adjustDc(iblUtil, dc, similarities, findResult$sim)
    }
  }

  list('dc' = dc, 'correctClassifications' = correctClassifications, 'incorrectClassifications' = incorrectClassifications)
}

buildSimilaritiesAndAcceptables = function (distanceCalculator, dc, trainingPointValues) {
  tempElementKey = 123456
  similarities = hashmap(tempElementKey, 0)
  acceptables = hashmap(tempElementKey, 0)
  for(dcIndex in 1:length(dc)) {
    dcPoint = dc[[dcIndex]]
    sim = distanceCalculator$calculate(trainingPointValues, dcPoint$getValues())
    similarities$insert(dcIndex, sim)
    if (iblUtil$isAcceptable(dcPoint)) {
      acceptables$insert(dcIndex, sim);
    }
  }
  similarities$erase(tempElementKey);
  acceptables$erase(tempElementKey);

  list('similarities' = similarities, 'acceptables' = acceptables)
}

findMostSimilar = function(similarities) {
  mostSimilarValue = 30000000000;
  mostSimilarKey = 0;
  for(key in h$keys()) {
    simValue = similarities[[key]]
    if (simValue < mostSimilarValue) {
      mostSimilar = key
      mostSimilarValue = simValue
    }
  }

  list('key' = mostSimilarKey, 'value' = mostSimilarKey)
}

findYMax = function(dc, similarities, acceptables) {
  yMax = 0
  yMaxSim = 0
  if (acceptables$size() > 0) {
    mostSimilar = findMostSimilar(acceptables)
    yMax = dc[[mostSimilar$key]]
    yMaxSim = mostSimilar$value
  } else {
    mostSimilarIndex = sample(1:length(dc), 1)
    yMax = dc[[mostSimilarIndex]]
    yMaxSim = similarities[[mostSimilarIndex]]
 }
 list('point' = yMax, 'sim' = yMaxSim)
}

adjustDc = function (iblUtil, dc, similarities, yMaxSim) {
  dcTemp = dc
  for(simKey in similarities$keys()) {
    dcPoint = dc[[simKey]]
    if (similarities[[simKey]] > yMaxSim) {
      if (iblUtil$isRejectable(dcPoint)) {
        dcTemp[[simKey]] = NULL
      }
    }
  }
  dcTemp
}

initialDataset = CancerDataset$new() # Available datasets: IrisDataset$new(), CarsDataset$new(), CancerDataset$new(), DoubleSpiral$new(), BankTwoDimensionsDataset$new()
iblUtil = IblUtil$new()
points = iblUtil$convertDatasetPointsToIblPoints(initialDataset$points())
datasets = iblUtil$divideDatasetIntoUpperBottomAndDc(initialDataset);
upperHalfPoints = iblUtil$convertDatasetPointsToIblPoints(datasets$upperHalf)
bottomHalfPoints = iblUtil$convertDatasetPointsToIblPoints(datasets$bottomHalf)
dc = iblUtil$convertDatasetPointsToIblPoints(datasets$dc)

firstTrainingResult = loop(iblUtil, upperHalfPoints, dc)
finalTrainingResult = loop(
  iblUtil,
  bottomHalfPoints,
  firstTrainingResult$dc,
  firstTrainingResult$correctClassifications,
  firstTrainingResult$incorrectClassifications
)

iblUtil$printResult(finalTrainingResult);
