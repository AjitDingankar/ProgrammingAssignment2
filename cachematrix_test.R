#### Test file for cachematrix.R
#### Uses three test matrices; a simple 2x2 of elements 1:4, 
#### rnorm 
source('cachematrix.R')

cat("####\nSimple 2x2 matrix\n")
cat("makeCacheMatrix(matrix(1:4, 2, 2))\n")
m <- makeCacheMatrix(matrix(1:4, 2, 2))

cat("m$get()\n")
print(m$get())

cat("Initially the cached inverse is NULL\n")
cat("m$getinv()\n")
print(m$getinv())

cat("First cacheSolve(m)\n")
print(cacheSolve(m))
cat("cacheSolve(m) again\n")
print(cacheSolve(m))
cat("cacheSolve(m) third time\n")
print(cacheSolve(m))

####
cat("\n####\nRandom 2x2 matrix\n")
cat("set.seed(44)\n")
set.seed(44)
cat("m$set(matrix(rnorm(4), 2, 2))\n")
m$set(matrix(rnorm(4), 2, 2))

cat("m$get()\n")
print(m$get())

cat("Check that after 'set' cached inverse is NULL\n")
cat("m$getinv()\n")
print(m$getinv())

cat("First cacheSolve(m)\n")
print(cacheSolve(m))
cat("cacheSolve(m) again\n")
print(cacheSolve(m))
cat("cacheSolve(m) third time\n")
print(cacheSolve(m))

####
cat("\n####\nRandom 16x16 matrix\n")
cat("m$set(matrix(rnorm(256), 16, 16))\n")
m$set(matrix(rnorm(256), 16, 16))

cat("m$get()\n")
print(m$get())

cat("Check that after 'set' cached inverse is NULL\n")
cat("m$getinv()\n")
print(m$getinv())

start.time <- Sys.time()
cacheSolve(m)
end.time <- Sys.time()
cat("Time taken for the first cacheSolve(m)", end.time - start.time, "\n")

start.time <- Sys.time()
cacheSolve(m)
end.time <- Sys.time()
cat("Time taken for the second cacheSolve(m)", end.time - start.time, "\n")

####
