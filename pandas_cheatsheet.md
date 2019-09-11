## Pandas

- Datetime 

  ```python
  import datetime as dt
  
  # if you want to cast string to date time and extract year/month
  df_drop1['Date'].apply(lambda x: dt.datetime.strptime(x,'%Y')).dt.year
  ```

- Concat

  ```python
  import pandas as pd
  
  pd.concat([df1,df2], 
            axis=0 or 1, 
            join="inner" or "outer", 
            keys=['k1','k2'],			# Multilevel Indexing
            join_axes=[df1.columns/index], sort=False)
  ```

  

- Merge

  ```python
  pd.merge(table1, table2, 
           on="", 				# Column name
           how="",				# inner,outer,left,right
           indicator=True,		# _merge colmn appears
           left_on="col1",
           right_on="col2",
           suffixes=('_left','_right')
  ```

  

- 