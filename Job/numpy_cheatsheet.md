## Numpy Cheat sheet



```python
import numpy
```


- Basic operations

```python

a = numpy.array([1,2,3,4], float)
b = numpy.array([5,6,7,8], float)

print a + b                     #[  6.   8.  10.  12.]
print numpy.add(a, b)           #[  6.   8.  10.  12.]

print a - b                     #[-4. -4. -4. -4.]
print numpy.subtract(a, b)      #[-4. -4. -4. -4.]

print a * b                     #[  5.  12.  21.  32.]
print numpy.multiply(a, b)      #[  5.  12.  21.  32.]

print a / b                     #[ 0.2         0.33333333  0.42857143  0.5       ]
print numpy.divide(a, b)        #[ 0.2         0.33333333  0.42857143  0.5       ]

print a % b                     #[ 1.  2.  3.  4.]
print numpy.mod(a, b)           #[ 1.  2.  3.  4.]

print a**b                      #[  1.00000000e+00   6.40000000e+01   2.18700000e+03   6.55360000e+04]
print numpy.power(a, b)         #[  1.00000000e+00   6.40000000e+01   2.18700000e+03   6.55360000e+04]

```
- Identity and Eye
```python
numpy.identity(3) #3 is for  dimension 3 X 3

numpy.eye(8, 7, k = 1)    # 8 X 7 Dimensional array with first upper diagonal 1.

```
- Floor, Ceil and Rint

  The *rint* tool rounds to the nearest integer of input element-wise.

```python
my_array = numpy.array([1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9])
print( numpy.floor(my_array))     #[ 1.  2.  3.  4.  5.  6.  7.  8.  9.]

print (numpy.ceil(my_array))	#[  2.   3.   4.   5.   6.  7.  8.  9. 10.]

print (numpy.rint(my_array))          #[  1.   2.   3.   4.   6.   7.   8.   9.  10.]
```

- Set print option

  ```python
  numpy.set_printoptions(sign=' ')
  numpy.set_printoptions(legacy='1.13')
  ```

  

- Sum and prod

  ```python
  my_array = numpy.array([ [1, 2], [3, 4] ])
  
  print( numpy.sum(my_array, axis = 0))         #Output : [4 6]
  print( numpy.sum(my_array, axis = 1))         #Output : [3 7]
  print( numpy.sum(my_array, axis = None))      #Output : 10
  
  print numpy.prod(my_array, axis = 0)            #Output : [3 8]
  print numpy.prod(my_array, axis = 1)            #Output : [ 2 12]
  print numpy.prod(my_array, axis = None)         #Output : 24
  ```

- Concatenate

  ```python
  numpy.concatenate((array_1, array_2, array_3), axis = 1)
  ```

  

- Dot and cross product

  ```python
  A = numpy.array([ 1, 2 ])
  B = numpy.array([ 3, 4 ])
  
  print numpy.dot(A, B)       #Output : 11
  print numpy.cross(A, B)     #Output : -2
  ```

  

- Transpose and flatten/ravel

  ```python
  my_array = numpy.array([[1,2,3],
                          [4,5,6]])
  
  print numpy.transpose(my_array)
  #Output
  [[1 4]
   [2 5]
   [3 6]]
  
  print my_array.flatten()
  #Output
  [1 2 3 4 5 6]
  ```

  

- Inner and outer product

  ```python
  A = numpy.array([0, 1])
  B = numpy.array([3, 4])
  
  print numpy.inner(A, B)     #Output : 4
  
  print numpy.outer(A, B)     #Output : [[0 0]
                              #          [3 4]]
  ```

- Polynomial operations

  ```python
  print numpy.poly([-1, 1, 1, 10])        #Output : [  1 -11   9  11 -10]
  
  print numpy.roots([1, 0, -1])           #Output : [-1.  1.]
  
  print numpy.polyint([1, 1, 1])          #Output : [ 0.33333333  0.5         1.          0.        ]
  
  print numpy.polyder([1, 1, 1, 1])       #Output : [3 2 1]
  
  print numpy.polyval([1, -2, 0, 2], 4)   #Output : 34
  
  print numpy.polyfit([0,1,-1, 2, -2], [0,1,1, 4, 4], 2)
  #Output : [  1.00000000e+00   0.00000000e+00  -3.97205465e-16]
  
  The functions polyadd, polysub, polymul, and polydiv also handle proper addition, subtraction, multiplication, and division 
  ```

  

- Determinant, Eigen, Inverse of a matrix

  ```python
  numpy.linalg.det([[1 , 2], [2, 1]])       #Output : -3.0
  
  #The linalg.eig computes the eigenvalues and right eigenvectors of a square array.
  vals, vecs = numpy.linalg.eig([[1 , 2], [2, 1]])
  print vals                                      #Output : [ 3. -1.]
  print vecs                                      #Output : [[ 0.70710678 -0.70710678]
                                                  #          [ 0.70710678  0.70710678]]
      
   numpy.linalg.inv([[1 , 2], [2, 1]])       #Output : [[-0.33333333  0.66666667]
                                                  #          [ 0.66666667 -0.33333333]]   
  
  
  ```

  