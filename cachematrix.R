## Matrix inversion is usually an expensive computation 
## so the cacheMatrix trades off space (memory is cheap ;-) 
## for performance by caching the inverse. 
####
## Run the cachematrix_test.R that tests the code with three 
## matrices and compares run-times for the last, relatively 
## big example. 

## Write a short comment describing this function
####
## makeCacheMatrix: Return a list of get/set functions for 
## the matrix itself and it's inverse. Whenever the matrix 
## changes, set the inverse to NULL (for cacheSolve to test). 

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, 
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
#### 
## cacheSolve: Return the inverse of the only argument 
## (which is assumed to be invertible) efficiently. 
## First checks if the inverse has been cached. If not, it 
## computes and caches it. 

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inverse <- x$getinverse()
  if(!is.null(inverse)) {
    message("Found cached inverse")
    return(inverse)
  }
  data <- x$get()
  inverse <- solve(data, ...)
  x$setinverse(inverse)
  inverse
}
