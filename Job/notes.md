# Study material

[TOC]



## Python

**Doubts/Notes**

1. String Alignment

   ```python
   ' '.ljust(4, ' ') + '-'.center(2, ' ') + '-'.rjust(4, ' ')

   ```

2. How ordered dictionary and frozen set can be useful ?

3. Map, reduce, itertools, filter, accumulator.

4. What are the various operators in python

**Interview Questions**

1. Basic HCF of two numers program

   ```
   find min of a,b
   for i in range -> min to 1:
   	if max and max divisible:
   		return i
   ```

   ​

2. Sorting algorithms - Buble sort

   ```python
   // Euclidean method
   // Normal approach
   ```

3. Write a class , generators, decorator in Python.

4. In what all cases can we use a decorator?

5. Write a code to read a file in batch using its memory address?

6. Difference between range and xrange. Since xrange is deprecated in Python 3, write a function to generate the same values without using range() function.

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



**Reference**

- [Basic pandas in 10 points ](https://pandas.pydata.org/pandas-docs/stable/getting_started/10min.html>**)

  ​

**Interview Questions**

1. Different between Merge v/s Concat v/s  Join ?




---

## SQL



**Interview Questions**

1. Describe all Window functions
2. How to create a temp/c table in mysql
3. Write a query to display the quarterly report 
4. Defining variable in MySQL
5. What are Triggers, write a trigger. How is it different from a stored procedure?
6. Explain the use of views?
7. Date functions in mySQL
8.  DBMS management and monitoring tools?
9. understanding of database object-oriented design and implementation?
10. knowledge of query optimization, creating schemas and SQL tuning
2. Query to alter a table and add a new column with with a check
3. What the various constraints in SQL?
4. 5 Date functions in SQL
5. NULLIF and Coalesce  use?
6. Which MySQL version is the latest
7. Write a query to find the employees with 3rd highest salaries in each department?
8. Is Full join and exclusive elements supported in MySql?
9. Lead and Lag functions
19. Will the original table be affected if updates are made on the view?
20.  Employee ( id, name, occupations) and Salary (emp_id, salary)
    ​
    // Even consider the assumption that you will be having duplicate emp_id,salary entries
21. Tell me more about indexing and how it is being stored in a database?
22. A binary search tree is given in a database, find the root, leaf and intermediate nodes? (Solve all medium level SQL problems in hackerrank)
23. ​


**Reference**

- [Datamovesme - SQL Handson questions](https://datamovesme.com/2019/12/30/hands-on-sql-practice-for-a-data-science-interview/)



## Aptitude





## General / Software engineering 

1. In as much detail as possible explain what happens behind the scenes when a website is being loaded?
2. Explain  in detail how internet works or how a web page is rendered by the browser?
3. How do you connec to an SSH and How can you read a file to the system which has lower processing speed and memory and download it to local for analysis?
4. How can you scrape a website and display the content, consider the fact that the same url will be accessed by multiple users so make sure you are making it more efficient? 