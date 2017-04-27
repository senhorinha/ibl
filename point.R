Point = setRefClass("Point",
    fields = list(valuesWithClass = 'vector', correctClassificationsCount = 'numeric', incorrectClassificationsCount = 'numeric'),
    methods = list(
      initialize = function(valuesWithClass, clazz) {
        .self$valuesWithClass = valuesWithClass
        .self$correctClassificationsCount = 1
        .self$incorrectClassificationsCount = 0
      },

      getClassificationsPrecision = function () {
        precision = 100
        classificationsCount = .self$getClassificationsCount()
        if (classificationsCount != 0) {
          precision = correctClassificationsCount / classificationsCount
        }

        precision
      },

      getClassificationsCount = function () {
        correctClassificationsCount + incorrectClassificationsCount
      },

      incrementCorrectClassification = function () {
        .self$correctClassificationsCount = correctClassificationsCount + 1;
      },

      incrementIncorrectClassification = function () {
        .self$incorrectClassificationsCount = incorrectClassificationsCount + 1;
      },

      getValues = function () {
        head(valuesWithClass, length(valuesWithClass) - 1)
      },

      getClass = function () {
        tail(valuesWithClass, 1)
      }
    )
)
