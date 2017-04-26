IblUtil = setRefClass("IblUtil",
    methods = list(
      divideDatasetIntoUpperBottomAndDc = function(dataset) {
        points = dataset$points()
        datasetRowSize = dim(points)[1]
        datasetClazzIndex = dim(points)[2]

        halfRowsSize = datasetRowSize / 2
        upperHalfOfDataset = head(points, halfRowsSize)
        bottomHalfOfDataset = points[(halfRowsSize+1):datasetRowSize, ]
        dc = matrix(upperHalfOfDataset[1,], 1, datasetClazzIndex)
        list('upperHalf' = upperHalfOfDataset, 'bottomHalf' = bottomHalfOfDataset, 'dc' = dc)
      },

      printResult = function (result) {
        print('--- DC ---')
        print(result$dc)

        print('--- Summary ---')
        print(paste('Correct classifications: ', result$correctClassifications))
        print(paste('Incorrect classifications: ', result$incorrectClassifications))
      },

      plotGraph = function (dc) {
        isBidimensional = dim(dc)[2] == 3
        if(isBidimensional) {
          plotter = Plotter$new()
          plotter$plotGraph(dc, 'ibl2_plot.png')
        }
      },

      convertDatasetPointsToIblPoints = function (datasetPoints) {
        rowsSize = dim(datasetPoints)[1]
        points = list()
        for(rowIndex in 1:rowsSize) {
          points[[rowIndex]] = Point$new(datasetPoints[rowIndex, ])
        }

        points
      },

      isAcceptable = function (point) {
        z = 0.9
        bottomLimit = bottomLimit(z, point)
        upperLimit = upperLimit(z, point)

        upperLimit < bottomLimit
      },
      
      bottomLimit = function (z, point) {
        p = point$getClassificationsPrecision()
        n = point$getClassificationsCount()

        (p + (z ^ 2 / 2 * n) - (z * sqrt(p * (1 - p)/n + (z^2 / 4 * n^2))))/(1 + (z^2/2))
      },

      upperLimit = function (z, point) {
        p = point$getClassificationsPrecision()
        n = point$getClassificationsCount()

        (p + (z ^ 2 / 2 * n) + (z * sqrt(p * (1 - p)/n + (z^2 / 4 * n^2))))/(1 + (z^2/2))
      }
    )
)
