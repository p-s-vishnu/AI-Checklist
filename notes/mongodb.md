# MonoDB

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

