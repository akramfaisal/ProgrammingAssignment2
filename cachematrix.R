## This is the R file written for the Programming Assignment 2:
## Lexical Scoping of R Programming Course on Coursera.
## Name: Akram Faisal
## Email: akramfaisal@gmail.com

## The task is to create a matrix inverse caching function. Inverse
## of a matrix is usually costly to compute. Therefore, is the
## matrix does not change, and if inverse is needed more than once,
## it might be a good idea to cache the inverse.
## NOTE: Caching sample code for mean of a vector was given,
##       therefore, will have similarity to it.
## NOTE 2: For this assignment, we are told to assume that the
##         matrix supplied is always invertible.


## Function (makeCacheMatrix) to create a matrix that provides:
## 1. Set the value of matrix
## 2. Get the value of matrix
## 3. Get the value of the inverse
## 4. Set the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
		## set the inv to NULL (i.e. not calculated yet)
		inv <- NULL
		
		## set the value of the matrix from input (y)
		set <- function(y) {
				x <<- y
				## set inverse to NULL since matix has changed
				inv <<- NULL 
		}
		
		## get matrix
		get <- function() x
		
		## set the inverse of this matrix (cache)
		setinv <- function(inverse) inv <<- inverse
		
		## get the nverse of this matrix (cache)
		getinv <- function() inv
		
		## list the methods for function call
		list(set = set, get = get,
			 setinv = setinv,
			 getinv = getinv)
}


## Function (cacheSolve) outputs the inverse of the above matrix
## Result depends on whether there already exists an inverse
## (cache). If cached inverse exists (i.e. inv not NULL), output
## from cache with indication, otherwise calculate new inverse
## using "solve" and store it in cache.

cacheSolve <- function(x, ...) {
		## read cached inverse
        inv <- x$getinv()
		
		## if inv is not NULL, means the matrix is not new nor
		## changed. so output the cached inverse.
        if(!is.null(inv)) {
                message("getting cached inverse")
                return(inv)
        }
		
		## otherwise, get the matrix and solve it
        ma <- x$get()
        inv <- solve(mat)
		
		## set the new inverse and return the result
        x$setinv(inv)
        inv
}
