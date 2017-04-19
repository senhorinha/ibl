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
      }
    )
)
