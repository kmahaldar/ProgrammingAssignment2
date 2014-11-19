# Sample Test run:
#create a matirx
#> x = rbind(c(2, -3), c(-5, 8))

#call makeCacheMatrix
#> m = makeCacheMatrix(x)

#test get and  set method
#> m$get()
#     [,1] [,2]
#[1,]    2   -3
#[2,]   -5    8

#call cacheSolve
# first time it should not return from cache
#> cacheSolve(m)
#     [,1] [,2]
#[1,]    8    3
#[2,]    5    2

#call cacheSolve again
#it should not return from cache
#> cacheSolve(m)
#getting cached data.
#     [,1] [,2]
#[1,]    8    3
#[2,]    5    2

#change the matix using set method
#> m$set(rbind(c(3, -5), c(-2, 1)))

#call cacheSolve again
#it should not return from cache
#> cacheSolve(m)
#           [,1]       [,2]
#[1,] -0.1428571 -0.7142857
#[2,] -0.2857143 -0.4285714