# Study material

[TOC]

## Python

**Doubts/Notes**

1. String Alignment

   ```python
   ' '.ljust(4, ' ') + '-'.center(2, ' ') + '-'.rjust(4, ' ')
   ```
   ​

2. How tuple, ordered dictionary and frozen set can be useful ?

   ```
   # tuple
   Immutable, unordered

   Only count() and index() functions present

   # will make the variable a tuple
   >>> singleton = 'hello',  
   >>> len(singleton) # 1

   # Ordered dictionary
   Application: While creating a dataframe using a dictionary, if the final order is important you can use ordered dict

   # frozen set

   ```
   ​

3. Call by value and call by reference in python?


   ```
# Call by value 
   def func(n):
       n += 1
    
   t = 1
   func(t)

   # Call by reference
   # pass an object/ iterable
   ```
4. List few itertools functions with examples

5. eval vs exec in Python?

   > eval, evaluates the expression and exec executes the statement
   >
   > eval("1 == 2") >>> False			exec("c=2")  

6. Generators and decorators with real life application

   ```
   # Generators

   ```

   ​

7. Map, reduce, itertools, filter, accumulator.

   ```

   ```

   ​

8. What are the various operators in python

5. Datetime functions in python

**Interview Questions**

1. Basic HCF of two numers program

   ```
   find min of a,b
   for i in range -> min to 1:
   	if max and max divisible:
   		return i
   ```

   ​

2. Sorting algorithms - Bubble sort

   ```python
   // Euclidean method
   // Normal approach
   ```
   ​

3. Write a class , generators, decorator in Python.

   ```
   # class 
   # generator
   # Decorators
   Decorators let you execute code before and after a function.
   ```

         4. In what all cases can we use a decorator?
         5. Write a code to read a file in batch using its memory address/files?
         6. Difference between range and xrange. Since xrange is deprecated in Python 3, write a function to generate the same values without using range() function.
         7. Find median from data stream? 
         8. Explain call by value and call by reference in python?
         Solved above
         9. Regex and date operations in python


   ## Numpy

   - Basic operations


   ```
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

   ```
   numpy.identity(3) #3 is for  dimension 3 X 3
   ```

numpy.eye(8, 7, k = 1)    # 8 X 7 Dimensional array with first upper diagonal 1.

   ```

- Floor, Ceil and Rint

  The *rint* tool rounds to the nearest integer of input element-wise.

​```python
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

  ​

---



## Pandas

**Doubts/Notes**

1. Datetime 

```python
import datetime as dt

# if you want to cast string to date time and extract year/month
df['Date'].apply(lambda x: dt.datetime.strptime(x,'%Y'))
# df['Date'].dt.year
```

2. Concat

```python
import pandas as pd

pd.concat([df1,df2], 
          axis=0 or 1, 
          join="inner" or "outer", 
          keys=['k1','k2'],			# Multilevel Indexing
          join_axes=[df1.columns/index], sort=False)
```

3. Merge

```python
pd.merge(table1, table2, 
         on="", 				# Column name
         how="",				# inner,outer,left,right
         indicator=True,		# _merge colmn appears
         left_on="col1",
         right_on="col2",
         suffixes=('_left','_right')
```

4. Multiple ways to read in pandas

   ```python
   # pd.read_csv()

   # pd.read_clipboard()

   # pd.DataFrame.from_dict()
   pd.DataFrame.from_dict(data, orient='index',
                          columns=['A', 'B', 'C', 'D'])
          A  B  C  D
   row_1  3  2  1  0
   row_2  a  b  c  d

   # pd.
   ```

   ​

**Reference**

- [Basic pandas in 10 points ](https://pandas.pydata.org/pandas-docs/stable/getting_started/10min.html>**)

  ​

**Interview Questions**

1. Different between Merge v/s Concat v/s  Join ?




---

## SQL

**Doubts/Notes**

- If the column is alpha numeric `c_1`, `c_10`, `c_2` will be the sorted order.

- Group by is NOT Case sensitive. eg: if you use group by some column and it is having values phone and Phone, both will be consider in the same group. If you want to consider it different then `COLLATE sql_latin1_general_cp1_cs_as`. *A MySQL collation is a set of rules used to compare characters in a particular [character set](https://www.mysqltutorial.org/mysql-character-set/).*

- Count(Distinct) can help in finding per group count

- `RIGHT(CITY, 1) in ('a','e')` similar for left()

- CAST('2003-01-01' AS DATE) 

- Compare Successive Rows Within The Same Table = 

      inventory g1
      INNER JOIN
      inventory g2 ON g2.id = g1.id + 1

- ROUND (12345.54, -2), round to a left 

- Loading other databases: `source/directory .. `

- BETWEEN usage : `from students s inner join grades g on s.marks between g.min_mark and g.max_mark`

- Difference between '=' and 'is'

  ```
  -- `is` is used in cases of Boolean like True, false and NULL
  whereas, = is used for single integer value
  ```

  ​

*Things to consider*

- Common maths functions

  ```mysql
  pow(<col>, n)

  sqrt(<col>)

  mod(<dividend>, <divisor>)

  --  truncates a number to a specified number of decimal places	
  -- function is similar to the ROUND() BUT no Rounding performed here
  TRUNCATE(X,D)

  ceil()

  floor()

  abs()

  std(), variance()
  ```

  ​

- Remove string with numeric values using MS Sql and pandas

  ```

  ```

  ​

- Date functions and aggregation

  ```mysql

  ```

- [Median of a column](https://www.hackerrank.com/challenges/weather-observation-station-20/problem) 

  ```
  SET @rowindex := -1;

  SELECT
     round(AVG(g.lat_n), 4)
  FROM
     (SELECT @rowindex:=@rowindex + 1 AS rowindex,
             lat_n
      FROM station
      ORDER BY lat_n) AS g
  WHERE
  g.rowindex IN (FLOOR(@rowindex / 2) , CEIL(@rowindex / 2));
  ```

  ​

- Regular expressions in SQL
  ```where <columns name> regexp ' <expression>'```

- Set a variable `SET @str = '12/31/2019'; select @somthing = <col> from <table>;`

- Start the MySQL ::: `sudo mysql -u root`

  ​



**Interview Questions**

1. Describe all [Window functions](https://www.mysqltutorial.org/mysql-window-functions/)

   ```mysql
   # General structure - 
   window_function_name(expression) 
       OVER (
           [partition_defintion]
           [order_definition]
           [frame_definition]
       )
       
   # 1. Aggregate functions
   eg: SUM(sale) over( partition by fiscal_year order by sales_employee)

   # 2. CUME_DIST() over( order by sale) 0<= x <=1

   # 3. first_value() or last_value() 
   eg: Identitify the employee with least overtime within department?
   select distinct first_value(emp_name) over(partition by department order by time_spent) 

   # 4. dense_rank and rank,percent_rank dense rank has no gaps whereas rank gives (1 + the NUMBER of ranks just before it), 	% rank = (rank - 1) / (total_rows - 1)
   ## important - MySQL RANK() function with CTE example - Top 2 employees from each dept
   with rank_list as (
   	
   )

   # 5. Lead (column,offset,replace) and Lag , eg:
   select sales_employee, sale, lag(sale,2,"-") over(partition by fiscal_year) from sales;

   # 6. nth_value and Ntile

   # 7. row_number
   ```



2. How to create a temp, derived, cte tables in mysql
Common table expression

   ​

3. Design your own database - 

   ```mysql
   /*
   Small database

   1. Write tests / Check for ambiguity
   2. Create core objects
   3. Define relationships
   4. Check use cases/ transactions/ functionalities
   */
   ```


   Large database

   Consider denormalizing the tables for faster retrieval but while hangling ambiguity
   */
   ```

1. Various data types in SQL

> BINARY, CHAR, DATE, DATETIME, TIME,DECIMAL, SIGNED, UNSIGNED .

4. Write a query to display the quarterly report 

5. Defining variable in MySQL

6. What are Triggers, write a trigger. How is it different from a stored procedure?

7. Explain the use of views?

8. Date functions in mySQL

9.  DBMS management and monitoring tools?

10. understanding of database object-oriented design and implementation?

11. knowledge of query optimization, creating schemas and SQL tuning

12. Query to alter a table and add a new column with with a check

13. What the various constraints in SQL?

14. 5 Date functions in SQL

15. NULLIF and Coalesce  use?

16. Which MySQL version is the latest

17. Write a query to find the employees with 3rd highest salaries in each department?

   ```
    # Use cte with rank()
    ​```
    
    ​

18. Is Full join and exclusive elements supported in MySql?

19. Lead and Lag functions

20. Will the original table be affected if updates are made on the view?

21.  Employee ( id, name, occupations) and Salary (emp_id, salary)
    ​
    // Even consider the assumption that you will be having duplicate emp_id,salary entries

22. Tell me more about indexing, types and how it is being stored in a database?

23. A binary search tree is given in a database, find the root, leaf and intermediate nodes?

24. 2nd highest paid employee in each department?

    ```
    select department,  employee_name 
    from 
    	(select department, employee_name, dense_rank() over (partition by department order by salary desc) 'ord' from basic_pays) temp 
    where ord = 2;
    ```

25. ​

    ​


**Reference**

- [Datamovesme - SQL Handson questions](https://datamovesme.com/2019/12/30/hands-on-sql-practice-for-a-data-science-interview/)




---

## MongoDB

1. mongod
   Starts the mongo db server. Ready to accept connections.
2. mongo
   Starts acceptiong connection to mongo db.
3. show dbs
   What database they have got
4. use db_name
   Even if doesnt exist it will be created and switched to it
5. show collections
   Similar to tables in normal databases
6. db.<collection>.insert({json})
7. db.<collection>.remove(<Some identifier eg: "Age"=10>)
8. db.find()

```python
# run mongodb server 
# create client
client = pymongo.MongoClient()

# get database
database = client['trvdb24']

# get collection
collection = database['students']

# Create/ Read/ Update/ Delete
# Insert/ Find/ Update/ Remove
student_cursors = collection.find()
students = [student for student in student_cursors]
```



---

## Machine learning

1. How linear regression  is different in both ML and Statistics?



---
