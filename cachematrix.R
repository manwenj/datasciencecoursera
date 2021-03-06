## Cache the inverse of a matrix
## Matrix inversion can be a costly computation andthere may be benefit
## to caching the inverse of a matrix rather than computing it repeatedly
##The two functions below create an object that stores a matrix and caches its inverse

## This function creates a special matrix object that can cache its inverse.


makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x<<-y
    inv <<- NULL
}

get <- function() x 
setinv <-function(inverse) inv <<-inverse
getinv <-function () inv
list (set=set, 
      get=get, 
      setinv=setinv, 
      getinv=getinv)
}


## This function computes the inverse of the special matrix returned by makeCacheMatrix above

cacheSolve <- function(x, ...) {
  inv<-x$getinv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <-x$get()
  inv <-solve(data, ...)
  x$setinv(inv)
  inv
}
