Classifier = setRefClass("Classifier",
    fields = list(distanceCalculator = 'DistanceCalculator', dataset = 'matrix'),
    methods = list(
       initialize = function(distanceCalculator, dataset) {
        .self$distanceCalculator = distanceCalculator
        .self$dataset = dataset
       },

      classify = function(point) {
        print('Must implement!')
      }
    )
)
