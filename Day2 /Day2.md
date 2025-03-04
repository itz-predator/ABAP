# Day 2: 
# Internal Tables 
-Internal tables provide a means of taking data from a fixed structure and storing it in working memory in ABAP. 
-The data is stored line by line in memory, and each line has the same structure. 
-In ABAP, internal tables fulfill the function of arrays.
## Data Type of an Internal Table
### Line Type

-The line type of an internal table can be any data type. The data type of an internal table is normally a structure. Each component of the structure is a column in the internal table. However, the line type may also be elementary or another internal table.

### Key

-The key identifies table rows. There are two kinds of key for internal tables - the standard key and a user-defined key. You can specify whether the key should be UNIQUE or NON-UNIQUE. Internal tables with a unique key cannot contain duplicate entries. The uniqueness depends on the table access method.
## Table type

## The table type determines how ABAP will access individual table entries. Internal tables can be divided into three types:

### 1.Standard tables have an internal linear index. 
-From a particular size upwards, the indexes of internal tables are administered as trees. 
-In this case, the index administration overhead increases in logarithmic and not linear relation to the number of lines. 
-The system can access records either by using the table index or the key. 
-The response time for key access is proportional to the number of entries in the table. 
-The key of a standard table is always non-unique. 
-You cannot specify a unique key. 
-This means that standard tables can always be filled very quickly, since the system does not have to check whether there are already existing entries.

### 2.Sorted tables are always saved sorted by the key. 
-They also have an internal index. 
-The system can access records either by using the table index or the key. 
-The response time for key access is logarithmically proportional to the number of table entries, since the system uses a binary search. 
-The key of a sorted table can be either unique or non-unique. 
-When you define the table, you must specify whether the key is to be UNIQUE or NON-UNIQUE. 
-Standard tables and sorted tables are known generically as index tables.

### 3.Hashed tables have no linear index. 
-You can only access a hashed table using its key. 
-The response time is independent of the number of table entries, and is constant, since the system access the table entries using a hash algorithm. 
-The key of a hashed table must be unique. When you define the table, you must specify the key as UNIQUE.

# Performance Optimization
## 1. Database Access Optimization:

-Efficient database access is key to improving ABAP program performance. Minimizing database roundtrips and utilizing appropriate access methods can significantly reduce database load and response times.

-Use WHERE clause in your SELECT statement to restrict the volume of data retrieved.  Very important !!

-Design your Query to Use as much index fields as possible in your WHERE statement

-Use INNER (or OUTER under some circumstances) JOIN in your SELECT statement to retrieve the matching records at one shot

-Avoid using nested SELECT statement and SELECT within LOOPs, better use JOINs or FOR ALL ENTRIES. Use FOR ALL ENTRIES when  the internal table is already there or the end of some processing. Try JOINs if the SELECT are right behind each other

-Avoid using INTO CORRESPONDING FIELDS OF TABLE during buffered access. Otherwise use the most appropriate for the program.

-Avoid using SELECT * and Select only the required fields from the table.

-Avoid using ORDER BY in SELECT statements if it differs from used index  (instead, sort the resulting internal table), because this may add additional work to the database system which is unique, while there may be many ABAP servers

## INDEX: Creation of Index for improving performance should not be taken without thought. Index speeds up the performance but at the same time adds two overheads namely; memory and insert/append performance. When INDEX is created, memory is used up for storing the index and index sizes can be quite big on large transaction tables! When inserting new entry in the table, all the index's are updated. More index more time. More the amount of data, bigger the indices, larger the time for updating all the indices

-Avoid Executing an identical Select (same SELECT, same parameter) multiple times in the program. Buffer in your abap code.

-Avoid using join statements if adequate standard views exist no performance impact


-Another technique is using buffering mechanisms. ABAP provides different buffering options. By buffering frequently accessed data, you can avoid unnecessary database hits and enhance performance.

## Defining a table as buffered (SE11) can help in improving the performance but this has to be used with caution. Buffering of tables leads to data being read from the buffer rather than from table. Buffer sync with table happens periodically, only if something changes which is happen rarely. If this table is a transaction table chances are that the data is changing for a particular selection criteria, therefore application tables are usually not suited for table buffering. Using table buffering in such cases is not recommended. Use Table Buffering for configuration data and sometimes for Master Data..

-Avoid using complex Selects on buffered tables-, because SAP may not be able to interpret this request, and may transmit the request to the database- The code inspector tells which commands bypass the buffer


 

## 2. Coding Techniques:

-Carefully crafted coding practices can greatly impact performance. Avoiding nested loops, reducing unnecessary calculations and data processing, and optimizing string operations and memory usage are important considerations. For instance, when working with large internal tables, using the binary search option or hashed tables can significantly improve search performance.

-Use HASHED tables where-ever possible. Otherwise SORTED tables. STANDARD tables should be the last choice.

-Use assign instead of into in LOOPs for table types with large work areas, if the data is being modified.

-When in doubt call transaction SE30 and check your code.

-If you must use a STANDARD table and you are using a READ, sort the table appropriately and use the addition BINARY SEARCH to speed up the search.

-PERFORM : When writing a subroutine, always provide type for all the parameters. This reduces the overhead which is present when system determines on it's own each type from the formal parameters that are passed. It also makes for more robust programming.


-Additionally, optimizing string concatenation using the '&&' operator instead of the '+' operator or CONCATENATE statement can yield better results. Avoiding excessive memory usage and leveraging appropriate data structures like sorted tables or hashed tables can also enhance performance.

 

# 3. Parallel Processing:

-Leveraging parallel processing techniques can distribute workload and execute tasks concurrently, leading to improved performance. Asynchronous RFC calls enable you to execute time-consuming tasks in the background, freeing up the main program for other operations. Background processing using job scheduling allows for executing heavy processes during off-peak hours, reducing the load during peak usage.

-Utilizing SAP NetWeaver Process Integration (PI) or other middleware solutions enables distributing tasks across multiple servers for parallel execution. This technique is particularly beneficial for data-intensive operations or long-running processes.

 

# 4. Performance Traces and Runtime Analysis:

-ABAP provides powerful tools for performance analysis. By using these tools, developers can pinpoint areas for optimization and make code improvements based on the analysis results.

-ST05 is the performance trace. It contain the SQL Trace plus RFC, enqueue and buffer trace. Mainly the SQL trace is is used to measure the performance of the select statements of the program.

-SE30 is the Runtime Analysis transaction and can be used to measure the application performance.

-SAT transaction is the replacement of the pretty outdated SE30. Provides same functionality as SE30 plus some additional features.

-ST12 transaction (part of ST-A/PI software component) is a combination of ST05 and SAT. Very powerful performance analysis tool used primarily by SAP Support.

-One of the best tools for static performance analyzing is Code Inspector (SCI). There are many options for finding common mistakes and possible performance bottlenecks.

-For example, analyzing the runtime analysis results can highlight which parts of the program consume the most time and identify inefficient loops or database access. Performance traces provide detailed information on SQL statements, database fetches, and memory consumption, aiding in fine-tuning performance-critical code sections.

 

# 5. Indexing and Table Partitioning:

-Optimizing database indexes and implementing table partitioning techniques are crucial for improving ABAP performance. Properly defined indexes and partitioning schemes can significantly enhance data retrieval and manipulation speed.

-By analyzing database access patterns and identifying frequently queried fields, you can create appropriate indexes to reduce query execution time. Table partitioning based on specific criteria, such as date range or specific values, can further optimize data retrieval and improve performance.
Use partitioning to manage large tables and indexes by dividing them into smaller, more manageable pieces. Partitions, like a large-scale index, provide faster and easier access to data.


-Each partition can reside on a separate segment. Partitions are database objects and can be managed independently. You can, for example, load data and create indexes at the partition level. Yet partitions are transparent to the end user, who can select, insert, and delete data using the same DML commands whether the table is partitioned or not.


-SAP ASE supports horizontal partitioning, in which a selection of table rows can be distributed among disk devices. Individual table or index rows are assigned to a partition according to a partitioning strategy.


-Partitioning is the basis for parallel processing, which can significantly improve performance.


 

# 6. Memory Management:

-Efficient memory management is essential for optimal performance. Dynamic memory allocation, avoiding memory leaks, and utilizing internal table work areas are important considerations.

-Using field symbols or ASSIGN statement for dynamic memory allocation enables efficient usage of memory resources. Proper deallocation of memory, especially in loops or recursive functions, helps prevent memory leaks. Utilizing internal table work areas for data processing can improve performance by reducing overhead.

## Optimize the usage of internal tables by selecting the appropriate table type (e.g., standard, sorted, hashed) based on the requirements.


-If you need to perform frequent lookups on a large dataset, consider using a hashed table for faster access.
## Example:
-DATA: lt_data TYPE HASHED TABLE OF ...
      
# Operations (READ, MODIFY, SORT, DELETE)
## READ 
-Reading a single record from Internal table to workarea.
### 1.Read the data from a location/Index:

-Syntax:

-READ TABLE <INTERNAL TABLE NAME> INTO <WORKAREA>

-                                                                      INDEX <INDEX NUMBER>.

 

### 2.Read the data from internal table into workarea based on a Key:

-Syntax:

-READ TABLE <INTERNAL TABLE NAME> INTO <WORKAREA>

-                                                               WITH KEY <CONDITION>

-                                                                 BINARY SEARCH.

## MODIFY
-Used to Overwrite the record values of an internal

-we can modify single record and multiple records of an internal table.
### Modify Single field of a record:

-Syntax:

-MODIFY <Internal table> from <workarea>

-                                 transporting <Fieldname> 

-                                             where <condition>.

### Modify Multiple fields of a record:

-MODIFY <Internal table> from <workarea>

-                                transporting <Fieldname1> 

-                                                       <Fieldname2>   

-                                           where <condition>.


## SORT
-Arrange the records of internal table in an order(Ascending/Descending).

- Note:

-By default, the data in the table is in 'Ascending order'.

-Syntax:

- SORT <Internal Table name> ascending/descending by <field1> <field2> ...etc.
## DELETE
-To delete the records of Internal Table.

-We can delete records by using below syntax:

### 1. Delete the record from a location

-Syntax:    

-Delete <INTERNAL TABLE NAME> INDEX 2.

 

### 2.Delete the range of records from internal table

-Syntax:

-Delete <INTERNAL TABLE NAME> from <N1> TO <N2>.

 

### 3.Delete the range of records from a record

-Syntax:

-Delete <INTERNAL TABLE NAME> from <INDEX NO>.

### 4.Delete internal table data based on a condition

-Syntax:

-DELETE <INTERNAL TABLE NAME> WHERE <CONDITION>.
## APPEND
-to append the workarea record at the last position of internal table.

-we can append:

- a. single record

- b. multiple records

### a. single record (one -> Many / Workarea-> Internal table)

-Syntax:

-  APPEND <WORKAREA NAME> TO <INTERNAL TABLE NAME>.

-Example:

-   wa_data-PATIENTID           = 9999.

-   wa_data-PATIENTNAME   = 'Addition1'.

-   wa_data-HOSPITALNAME = 'Alpha Hospital'. 

-   APPEND wa_data to IT_DATA.

 -  CLEAR wa_data.
### b. Multiple records (Many->Many / Internal table1 to internal table2)

-Syntax:

-APPEND LINES OF <Internal table name1> to <Internal table name2>.

-Note: While appending 1 internal table data with another internal table, the structures of the both internal tables should be same.
## INSERT
-to insert the records into internal table in a specific location.

  a. single record

  b. Multiple records 

### Syntax to insert a single record:

-INSERT <WORKAREA> INTO <INTERNAL TABLE> INDEX <Index Number>.

-Example:

wa_data-PATIENTID           = 8888.

wa_data-PATIENTNAME    = 'Insert1'.

wa_data-HOSPITALNAME = 'Sample Hospital'.

INSERT WA_DATA INTO IT_DATA INDEX 4.

CLEAR wa_data.

 
### Syntax to insert multiple records:

-INSERT LINES OF <INTERNAL TABLE1> FROM <from Index number> TO <index5>

-           INTO <INTERNAL TABLE2> INDEX <INDEX NO>.




# S/4HANA Optimization: 
## CDS views vs. Open SQL:
-**CDS View represents a View that can be modelled/created or modified in Eclipse/HANA Studio/VS Code only.**
-**This cannot be created/Modified in SE11(SAP GUI) only can be Viewed where as SQL View is auto-generated when a CDS view is activated.**
### CDS Views
-Core data services (CDS) are used in the next generation of data definitions, capable of defining semantically rich database tables/views (CDS entities) and providing access for database-centric applications. 
-These views are technically extensions of SQL where expressions can be used on fields, domain-specific metadata can be defined, and associations created between related tables.
### The benefits of using SAP CDS Views are the following:

-Like open SQL, CDS views can be used with any database that is supported by SAP and are database independent.
-While CDS view allows for calculated fields, such as the addition of two fields at runtime, SE11 view does not.
-Inner, outer, right outer, full, and cross joins are supported by CDS views.
-Views for CDS offer automatic client management.
-Open SQL is supported by CDS views, and we may call them from the application layer in the same manner we call any SE11 view.
-The CDS viewpoints support the WHERE, GROUP BY, HAVING, and UNION clauses.
-CDS views allow both numeric and aggregation functions.
-Through CDS views, we may immediately obtain OData service.
## Aggregation in CDS
-Aggregate functions in CDS views are essential for summarizing, analyzing, and deriving insights from large datasets. 
-From sales reporting to procurement and beyond, these functions empower businesses to make data-driven decisions with ease.
### Example
-aggregation is the task of collecting a set of values to return a single value. 
-It is done with the help of aggregate functions, such as SUM, COUNT, and AVG. 
-For example, in a database of products, you might want to calculate the average price of the whole inventory.

# ABAP Profiler & SQL Trace: Analyzing SQL execution times and bottlenecks
## ABAP Profiler
-By default, ABAP profiling is switched off, so that the system’s performance is not impaired. 
-To enable profiling, access the ABAP Trace tool via transaction code SAT and configure the profile recording.
-The ABAP Profiler allows you to examine the performance of transactions, ABAP programs, function modules, global ABAP classes, and Web Dynpro applications.

-You can use the ABAP trace (the results of the ABAP Profiler) to identify runtime-intensive statements and to follow the hierarchy of program calls.

-Starting from the ABAP trace, you can:

-Identify performance hot spots where you might want to concentrate your re-factoring effort.
-Identify excessive or unnecessary use of modularization units.
-Identify CPU-intensive program functions
-Analyze the flow of your application
## SQL TRACE
-The SQL Trace, which is part of the Performance Trace (transaction ST05), is the most important tool to test the performance of the database. 
### 1. Using the SQL Trace

-Using the SQL trace is very straightforward:

-1.Call the SQL trace in a second mode

-2.Make sure that your test program was executed at least once, or even better, a few times, to fill the buffers and caches. Only a repeated execution provides reproducible trace results. Initial costs are neglected in our examination

-3.Start the trace

-4.Execute your test program in the first mode

-5.Switch off the trace. Note, that only one SQL trace can be active on an application server, so always switch your trace off immediately after your are finished.

-6.Display the trace results

-7.Interpretation of the results
- _Note, the trace can also be switched on for a different user._
  
# Hands-on: 
## Optimize a SELECT query using CDS, Proper Indexing, and Buffering.
### Example with code 
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Optimized CDS View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZRS_PO_TRACKING as select from ekko

    inner join ekpo on ekko.ebeln = ekpo.ebeln

{
ekko.ebeln,
ekko.bukrs,
ekko.ekorg,
ekko.aedat,
ekpo.ebelp,
ekpo.matnr,

ekpo.meins
}

