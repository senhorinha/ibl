EuclideanDistanceCalculator <- setRefClass("EuclideanDistanceCalculator",
    contains = "DistanceCalculator",
    methods = list(
        calculate = function(dimensionsOne, dimensionsTwo) {
            sqrt(sum((as.numeric(dimensionsOne) - as.numeric(dimensionsTwo)) ^ 2))
        }
    )
)
