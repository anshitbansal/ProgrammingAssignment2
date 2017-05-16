## In tandem, these function cache the inverse of a matrix to

## return at a future time without extra calculations.




## makeCacheMatrix creates a martix object and cache's its inverse




makeCacheMatrix <- function(x = matrix()) {

        inv <- NULL

        set <- function(y) {

                x <<- y

                inv <<- NULL

        }

        get <- function() x

        setinv <- function(inverse) inv <<- inverse

        getinv <- function() inv

        list(set = set, get = get,

             setinv = setinv,

             getinv = getinv)

}







## cacheSolve computes inverse of matrix returned by makeCacheMatrix







cacheSolve <- function(x, ...) {

        inv <- x$getinv()

        if(!is.null(inv)) {

                message("getting cached data")

                return(inv)

        }

        data <- x$get()

        inv <- solve(data, ...)

        x$setinv(inv)

        inv

}
