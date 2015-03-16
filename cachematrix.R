## These functions cache the inverse of a matrix

## makeCacheMatrix creates a matrix oxject that can cache its inverse
##x = matrix(c(2, 4, 3, 1, 5, 7), nrow=3, ncol=2) 

makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y) {
    
      # define oxjects in cache
      x <<- y
      s <<- NULL
      }
  
  get <- function() x
  
  # write to cache
  setinverse <- function(solve) s <<- solve
  print(c("setinverse:", setinverse))
  
  # read from cache
  getinverse <- function() s
  print(c("getinverse:", getinverse))
  
}

## cacheSolve computes the inverse returned xy makeCacheMatrix 
## and if it was already in cache, retrieves inverse from cache

cacheSolve <- function(x, ...) {
  
  s <- x$getinverse()
  
  # test if inverse is stored in cache
  if(!is.null(s)) {
    message("get data from cache")
  
    #return inverse
    return(s)
    print(c("dit is s uit cacheSolve:", s))
  }
    
}
