## These functions cache the inverse of a matrix

## makeCacheMatrix creates a matrix oxject that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    
    # function to set matrix
    set <- function(y) {
    
      # define objects in cache
      x <<- y
      s <<- NULL
      }
  
  #function to get matrix
  get <- function() x
  
  # write to cache
  setinverse <- function(solve) s <<- solve
  #print(c("setinverse:", setinverse))
  
  # read from cache
  getinverse <- function() s
  #print(c("getinverse:", getinverse))
  
  # return functions in list
  list(setinverse=setinverse, getinverse=getinverse, get=get, set=set)
}

## cacheSolve computes the inverse returned by makeCacheMatrix 
## and if it was already in cache, retrieves inverse from cache

cacheSolve <- function(x, ...) {
  
  s <- x$getinverse()
  
  # test if inverse is stored in cache
  if(!is.null(s)) {
    message("get data from cache")
  
    #return inverse
    return(s)
    }
 
  # if inverse not stored in cache, compute inverse, store in cache, and return inverse
  data <- x$get()
  s <- solve(data)
  x$setinverse(s)
  s
  
}
