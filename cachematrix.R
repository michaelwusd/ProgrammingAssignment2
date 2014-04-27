## Put comments here that give an overall description of what your
## functions do

## In order to cache potentially time-consuming computations, the
## program tries to avoid computing repeatedly. Moreover, the task
## is to invert a matrix given any invertible matrix.

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    ## x is a invertible matrix which should be a square matrix.
    
    ## create a special matrix, which is really a list containing a
    ## function to the following:
    ## 1. set the values of the matrix
    ## 2. get the matrix with the values
    ## 3. set the values of invertible matrix
    ## 4. get the invertible matrix
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) m <<- inverse
	getinverse <- function() m
	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## x is a invertible matrix which should be a square matrix.
    
    ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if (!is.null(m)) {
        message("getting cached data")
        return (m)
    }
    data <- x$get()
    m <- solve(data)
    x$setinverse(m)
    m
}
