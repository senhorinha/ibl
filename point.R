Point = setRefClass("Point",
    fields = list(values = 'vector', correctClassificationsCount = 'numeric', incorrectClassificationsCount = 'numeric'),
    methods = list(
      initialize = function(values, clazz) {
        .self$values = values
        .self$correctClassificationsCount = 3
        .self$incorrectClassificationsCount = 10
      },

      getClassificationsPrecision = function () {
        precision = 0
        classificationsCount = .self$getClassificationsCount()
        if (classificationsCount != 0) {
          precision = correctClassificationsCount / classificationsCount  
        }
        
        precision
      },

      getClassificationsCount = function () {
        correctClassificationsCount + incorrectClassificationsCount
      }
    )
)
