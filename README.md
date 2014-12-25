CoreData Tutorial
=============
<b>Contents</b>
- What is Core Data.
- Overview of Framework
- Using Core Data
- Demo

<b>What is Core Data ?</b><br/>
Core data is not a database.
It is not even a Object Relational Mapping Framework.
According to the definition in apple documentation “Core Data is a schema driven object graph management and persistence Framework”, which creates a layer between database and user interface.
. <br/><br/>
<b>Why learn Core Data</b><br/>
- Before Core Data developers had to work with SQLite to save and manage data.
- Handling CRUD operations was difficult.
- When using SQLite user was responsible to check if saved data matched the schema.
- Means, we were our own persistence layer.<br/><br/>
<b>Why Use Core Data</b><br/>
- Core Data is supported by apple.
- Using Core Data hides the SQLite and make CRUD operations much easier.
- To use core data it is not necessary that one must know SQL.<br/><br/>
<b>Storage Options</b><br/>
We have different options when it comes to storing and managing data,  which are as following.<br/>
- In-memory 
- XML (only for MAC OS X)
- Binary
- Plists
- Sqlite<br/><br/><br/>
<b>Core Data vs  SQLite</b><br/>
![Alt text](http://s13.postimg.org/jfbkrdofb/Screen_Shot_2014_12_25_at_5_48_48_pm.png) <br/><br/>
<b>Core Data and MVC</b><br/><br/>
![Alt text](http://s23.postimg.org/s00kw6v3f/Screen_Shot_2014_12_25_at_5_55_42_pm.png) <br/><br/>
<b>Core Data Stack</b><br/>
Heart of Core Data
- NSmanagedObjectModel
- NSPersistentStoreCoordinator
- NSManagedObjectContext
<br/>
![Alt text](http://s3.postimg.org/dtl3t2b8j/Screen_Shot_2014_12_25_at_6_58_21_pm.png)<br/><br/>
<b>NSManagedObjectModel</b>
<br/>
ObjectModel is the object representation of model data resource file.
It contains
- Entities
- Attributes
- Relationships
- Fetch requests
- Schema for Models
<br/>
There are certain types of Attributes, which are
 - String
 - Date
 - Binary Data
 - Boolean
 - Integer
 - Decimal
 - Floats
 - Double
 - Transformable
 <br/>

There can be different types of relationships.
- NSSet not NSarray
- One to One
- One to Many
- Many to Many 
- Delete Rules
<br/>
![Alt text](http://s12.postimg.org/5qtjrtect/asd.png)
<br/><br/>
<b>NSPersistentStoreCoordinator</b>
- Coordinates access to one or more persistent store
- Depends on Managed Object Model
- Set store options
![Alt text](http://s14.postimg.org/iha026q29/image.png)
<br/>
<b>NSManagedObjectContext</b>
![Alt text](http://s24.postimg.org/dg07uukd1/image.png)
<br/>
<br/>
<b>Core Data Model</b><br/>
![Alt text](http://s11.postimg.org/rpc0rzzbn/image.png)
<br/>
<br/>
![Alt text](http://s24.postimg.org/7x6v54239/image.png)
<br/><br/>
<b>Saving an Object</b><br/>
![Alt text](http://s24.postimg.org/z60bk0ql1/image.png)
<br/>
<b>NSFetchRequest</b><br/>
![Alt text](http://s3.postimg.org/eub37fo83/image.png)<br/<br/>
<b>NSFetchedResultsController</b><br/>
![Alt text](http://s12.postimg.org/6df4vho17/image.png)

