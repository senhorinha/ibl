library('hashmap')
library("readxl")
library("deldir")
library("readxl")

# Load distance calculators
source('distance_calculators/distance_calculator.R')
source('distance_calculators/hamming_distance_calculator.R')
source('distance_calculators/euclidean_distance_calculator.R')

# Load classifiers
source('classifiers/classifier.R')
source('classifiers/nearest_neighbour_classifier.R')
source('classifiers/k_nearest_neighbour_classifier.R')

# Load datasets
source('dataset/dataset.R')
source('dataset/cars_dataset.R')
source('dataset/bank_two_dimensions_dataset.R')
source('dataset/spiral.R')
source('dataset/double_spiral.R')
source('dataset/cancer_dataset.R')
source('dataset/iris_dataset.R')

# Plotters
source('plotter.R')

# IBL
source('ibl_util.R')
