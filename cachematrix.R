#Matrix inversion is usually a costly computation 
#and there may be some benefit to caching the inverse of a matrix rather than compute it repeatedly.
#This R program creates a pair of functions that cache the inverse of a matrix.


# makeCacheMatrix: This function creates a special "matrix" object 
# the special matrix object exposes  following functions 
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    # set the value of inverse matrix to NULL 
    inv <- NULL
    
    # whenever the matix will be changed , inverse will be set as null
    # that will solve the requirement "check if the matrix has not changed"
    set <- function(y) {
      x <<- y
      inv <<- NULL
    }
    
    get <- function() x
    
    setinverse <- function(inverse) inv <<- inverse
  
    getinverse <- function() inv
  
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)

}


## cacheSolve: This function computes the inverse of the special matrix 
## returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    #try to get inverse from cache
    inv <- x$getinverse()
    
    # check if an inverse is found  
    if(!is.null(inv)) {
        message("getting cached data.")
        return(inv)     
    }
    
    #otherwiese calculate inverse and set in cache , return the value
    data <- x$get()
    inv <- solve(data,...)
    x$setinverse(inv)
    return(inv)
    
}
