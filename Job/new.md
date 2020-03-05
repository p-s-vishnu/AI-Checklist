## List

1. ML Flow: Solves three problems 
   MLFlow tracking, MLFlow Projects, MLFlow Models -> documents the experiments, reusable, reproducible form and managing/deployment of models.
2. IBM Maximo for asset management solution and CMMS (Computer maintenance management system)
3. Azure Eventhub: A plug and play scalable module for data ingestion and storing.
4. OCR libs: Pytesseract, pyocr, opencv
5. Python parallelization (Documentation): Python's threads are not suitable for CPU-bound tasks, only for I/O-bound.
6. Serialization and deserialization of python objects, mashaling and pickling. Methods: dump(), dumps(), load(), loads(). [links](https://realpython.com/python-json/).
7. import os -> chdir(), mkdir(), listdir(), curdir

8. [JSON](https://realpython.com/python-json/) :If an object is Serialized and the same object is deserialized and compared with each other they might not always be equal.

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
