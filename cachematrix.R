## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## makeCacheMatrix: function creates a special matrix that can cache it's inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Write a short comment describing this function
## cacheSolve: function computes the inverse of the matrix
## if inverse values are already present it returns the cached matrix data with message
## otherwise creates a new inverse matrix
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
          i <- x$getinverse()
          if (!is.null(i)) {
            message("returning cached data")
            return(i)
          }
          data <- x$get()
          i <- solve(data, ...)
          x$setinverse(i)
          i
}
