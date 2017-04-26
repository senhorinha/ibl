Point = setRefClass("Point",
    fields = list(valuesWithClass = 'vector', correctClassificationsCount = 'numeric', incorrectClassificationsCount = 'numeric'),
    methods = list(
      initialize = function(valuesWithClass, clazz) {
        .self$valuesWithClass = valuesWithClass
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
      },

      getValues = function () {
        head(values, length(values) - 1)
      },

      getClass = function () {
        tail(values, 1)
      }
    )
)
