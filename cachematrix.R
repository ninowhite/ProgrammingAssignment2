## The combination of the two functions below will cache the
## the inverted value of a defined matrix and call on said value
## for later if it has already been cached, saving in processing time or
## the value will be calcualted if not found in cache repo

## makeCacheMatrix generates four functions that will set or get a 
## value for first time calc and set or get the inverse of the of 
## matrix from repo if already calcualted

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## Returns inverse of matrix by first searching for Cache value in repo or 
## calcluating using 'if' statement

cacheSolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}
