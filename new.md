## List

1. **ML Flow**: Solves three problems 
   MLFlow tracking, MLFlow Projects, MLFlow Models -> documents the experiments, reusable, reproducible form and managing/deployment of models.
2. IBM Maximo for asset management solution and CMMS (Computer maintenance management system)
3. Azure Eventhub: A plug and play scalable module for data ingestion and storing.
4. OCR libs: Pytesseract, pyocr, opencv
5. [Argparse module](https://docs.python.org/3/library/argparse.html): A module for easy to use command line interface
6. Python vars() returns the `__dict__` attribute of the given object, if the there is no attribute then it raise a TypeError exception.
7. Symbol table in python, A symbol table is a data structure maintained by a compiler which contains all necessary information about the program. These include variable names, methods, classes, etc. There are mainly two types of symbol table - Global globals() and Local locals() symbol table
5. Python parallelization (Documentation): Python's threads are not suitable for CPU-bound tasks, only for I/O-bound.
6. Serialization and deserialization of python objects, mashaling and pickling. Methods: dump(), dumps(), load(), loads(). [links](https://realpython.com/python-json/).
```python
tup = (1,"Vishnu")

with open("Vishnu.obj",'w') as file_obj:
    serialize = json.dump(tup,file_obj)
    
with open("Vishnu.obj",'r') as file_obj:
    deserialize = json.load(file_obj)
    
print(tup, type(tup))
print(deserialize, type(deserialize))
print(serialize == deserialize)

tup == tuple(deserialize)
```

7. [JSON](https://realpython.com/python-json/) :If an object is Serialized and the same object is deserialized and compared with each other they might not always be equal.
8. import os -> 
   chdir(), mkdir(), listdir(), curdir
9. '===' strict comparison.
10. Virtual Environment: 
```
conda create -n venv pip python=3.7  # select python version
conda create -n myenv python=3.6 # tensorflow working 
conda create -n myenv python=3.6 scipy=0.15.0 astroid babel
```

11. Bash command - cat(concatenate):
```
cat can be used to view
cat test > test2 # data of test will be overwritten to test2
cat test >> test2 # data will be appended
cat < test2 # input will be taken from the file
cat test.txt | less/more
```
12. `glob` module: The glob module finds all the pathnames matching a specified pattern according to the rules used by the Unix shell, although results are returned in arbitrary order. No tilde expansion is done, but *, ?, and character ranges expressed with [] will be correctly matched.

    ```python
    import glob

    file_names = glob.glob('*.json')
    ```

    ​

13. Context Manager [ __enter__() and __exit__() ]: This interface of __enter__() and __exit__() methods which provides the support of with statement in user defined objects is called Context Manager.
```python
from contextlib import contextmanager 
  
class MessageWriter(object): 
    def __init__(self, filename): 
        self.file_name = filename 
  
    @contextmanager
    def open_file(self): 
        try: 
            file = open(self.file_name, 'w') 
            yield file
        finally: 
            file.close() 
  
# usage 
message_writer = MessageWriter('hello.txt') 
with message_writer.open_file() as my_file: 
    my_file.write('hello world')
```

14. **Azure Data Factory**: Azure Data Factory (ADF) is a Microsoft Azure PaaS solution for data transformation and load. ETL tool.

15. **Databricks** is a cloud based data engineering used for processing and transforming massive quantities of data and exploring the data through ML models.

16. **LIME** - Local Interpretable Model-Agnostic Explanations

17. **ExcelWriter Object**, used to write into multiple sheets

```python
with ExcelWriter('path_to_file.xlsx', mode='a',
      date_format='YYYY-MM-DD',
      datetime_format='YYYY-MM-DD HH:MM:SS'
      ) as writer:
    df1.to_excel(writer, sheet_name='Sheet1'),
    df2.to_excel(writer, sheet_name='Sheet2'),
    
```

18. Regex ignore case flag
```
re.search('test', 'TeSt', re.IGNORECASE)
re.match('test', 'TeSt', re.IGNORECASE)
re.sub('test', 'xxxx', 'Testing', flags=re.IGNORECASE)
```
19. ?: in Regex

    It indicates that the subpattern is a non-capture subpattern. That means whatever is matched in pattern eg: (?:\w+\s), even though it's enclosed by () it won't appear in the list of matches

    [REad this for ](https://stackoverflow.com/questions/3512471/what-is-a-non-capturing-group-in-regular-expressions) better understanding . Along with example.

20. **Lambda functions and APIs**
```
Things to consider while deploying an API onto a service like AWS Lambda

1. Size: of the api when uncompressed
2. Security policies: So that the service is onlu accesible to your white listed IPs
3. Authentication: If exposing to end customers, how are you planning an API authentication mechanism
4. Startup time and Timeout: Heavy models take time to be loaded in memory, so is the customer ok waiting for that long also whether the service waiting for the API timeout if it doesnt get the output within a certain timeframe.
```

21. **Captum:** Is an opensource extensible library for model interpretability built on PyTorch.

22. **PyTorch Geometric:** Deep learning on irregular input data such as graphs, point clouds, and manifolds. A point cloud is a set of data points in space. Point clouds are generally produced by 3D scanners, which measure many points on the external surfaces of objects around them.eg: Building 3D scans. Manifold is a collection of points forming a certain kind of set, such as those of a topologically closed surface or an analogue of this in three or more dimensions.

22. **skorch** is a high level library for Pytorch that provide full scikitlearn compatibility.

23. **Python, pip and Wheel installation:** Install files directly using `pip install <filename.whl>`. But before downloading the whl your must check the right configuration. Your system might be 64 bit OS but the python you installed can be 32 bit, so check the python version by `import platform and print platform.architecture()` to see which version of python you have installed. [link](https://stackoverflow.com/questions/28568070/filename-whl-is-not-supported-wheel-on-this-platform). Some specifications of the whl -eg: `torch-1.4.0+cpu-cp38-cp38-win_amd64.whl` here cp38 is cpython 3.8 and amd64 is the installed Python's architecture.

24. **Docx to JSON** we can use the library *mammoth* to convert docx to html and then use *beautiful soup* to extract JSON from HTML.
