HammingDistanceCalculator <- setRefClass("HammingDistanceCalculator",
    contains = "DistanceCalculator",
    methods = list(
        calculate = function(vectorOne, vectorTwo) {
            sum(abs(as.numeric(vectorOne) - as.numeric(vectorTwo)))
        }
    )
)
