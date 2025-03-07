# Day 4: 
# ABAP on HANA 

## What is Code-To-Data Paradigm?
- “Code Pushdown” is a paradigm also called “code-to-data” compared to the classic approach; it is data-centric, meaning you should execute intensive, expensive computations in the database layer as much as possible to use the computing power of HANA fully.

- ![image](https://github.com/user-attachments/assets/7ec5ec51-56a5-46f5-b287-c19364cb1930)


- Because of C2D paradigm the delay caused due to latency of bringing large volumes of data to presentation layer is removed drastically resulting in high performance even with very large data sets.

## OpenSQL Programming
- With OpenSQL programming you can write openSQL syntax in your ABAP code.

- While writing code in OpenSQL the fields in select statement are comma separated, all the host  variables are escaped using ‘@’ sign, the concatenation can be done in a single statement using ‘| |’ and so on and so forth.
  - Refer Day4/open_sql.abap
    


## CDS Views
- SAP introduced a new data modeling infrastructure known as core data services or CDS.
- With CDS, data models are defined and consumed on database server rather than on application server.
- As a result, the table result view is created at the database level.
- CDS are completely compatible with openSQL and can be written using ABAP development tools like Eclipse with ADT.
- These can be consumed by reports and AMDPs as well/ODATA too for fiori apps .
- Refer Day4/data_def.abap
- Now CDS views could also be created with parameters or with associations.
- You may choose to create a CDS with parameters if you have a fixed result set and some input parameters to pass.
- You could also create a CDS with association for a similar scenario if you have many tables to address in the view and if you want to keep the result set flexible.


## ABAP Managed Database Procedures (AMDP)
- AMDPs as the name says are database procedures that run on database directly and are written directly in ABAP.
- AMDPs are written using AMDP classes.
- Below is an example using the above scenario of how to create an AMDP class.
- The interface “IF_AMDP_MARKER_HDB” distinguishes an AMDP class from other classes.
- Refer Day4/data_def_amdp.abapclass
- Similarly, an AMDP class implementation will have methods define with a syntax “BY DATABASE PROCEDURE FOR <database> LANGUAGE <language>.
- In our case database will be HDB (HANA DB) and language will always be SQLSCRIPT.

- Refer to Day4/data_def_amdp2
- This AMDP class can then be consumed in an ABAP program to achieve the code push down functionality.
- Refer Day4/zact_amdp2.abap

  ### What to choose OpenSQL or CDS or AMDP?
  - A question that would arise in any developers mind would be how to make a choice amongst the three programming techniques.

 

- In the above example you can see that the performance was CDS > OpenSQL > AMDP.

- Does that mean for the above scenario the best choice is to create a CDS? Not exactly!

- If I do not reuse the CDS view then openSQL could be an equally effective choice.

 

- Also note that CDS views and AMDP can only be created using ABAP Development Tools like Eclipse.
- There are no rules that can be adhered to when choosing from the above three programming techniques.
- It completely depends on the requirement and on what and how data needs to be handled.
### Choose Open SQL when:

- The table selection is program specific and will not be reused

- When you do not have an ABAP Development Tool to create CDS or AMDP. The two can be consumed in GUI but cannot be created in GUI.

- When the data in question does not involve intensive calculations, and can be managed easily by OpenSQL.

- When you have a tricky selection screen with lot of select options that will be passed as single values too.
  ### Choose CDS views when:

- The view can be reused among other views or programs.

- When a large volume of data is involved from various data sources.

- When you have good knowledge on how to write annotations to enhance your CDS view.

- Only single result set is required.
  ###  Choose AMDPs When:

- You are fluent with SQL scripting because your entire code will be written in SQL script and the compiler fails in determining the runtime SQL script errors like divide by zero.

- When you have to handle cross client data because AMDP does not do client handling on its own.

- When multiple result sets are required.


## CDS Views:
- Core Data Service (CDS) Views are virtual data models of SAP HANA which allows direct access to underlying tables of the HANA database.
- SAP CDS Views came into being with SAP’s new programming model. SAP CDS Views aim to push logic from the application server to the client-side and database.
- This is defined by SAP as ‘Code -to-Data’ or ‘Code Pushdown’. An SAP CDS View is what performs the ‘Code-to-Data’ or ‘Code Pushdown’.
- The SAP CDS View picks up the logic from the ABAP application and executes it on the database rather than the application server.
## Joins
- Join is nothing but a conditional linkage between two data sources it may be a table or another in CDS view.
- There are four types of join exist in the CDS view

 ### 1.Inner Join
 - A join between two data sources using INNER JOIN or just JOIN selects all entries of the data sources whose fields meet the ON condition.
   
 ### 2.Left outer Join
 - A join between two data sources using LEFT OUTER JOIN selects all entries on the left side.
 - Entries that meet the ON condition have the same content as in the inner join.
 - In entries that do not meet the ON condition, the elements on the right or left side have the null value that is set to the type-dependent initial value when the CDS view is used in Open SQL.
 ### 3.Right outer Join
 - A join between two data sources using RIGHT OUTER JOIN selects all entries on the right side.
 - Entries that meet the ON condition have the same content as in the inner join.
 - In entries that do not meet the ON condition, the elements on the right or left side have the null value that is set to the type-dependent initial value when the CDS view is used in Open SQL.
 ### 4.Cross Join
 - When two data sources are joined using CROSS JOIN, their cross product is produced.
 - All entries on the left side are combined with all entries on the right side.
 - The number of rows in the results set is the number of rows on the left side multiplied by the number of rows on the right side.


  
## Associations
- Association is nothing but the relationship between two entities, well the definition is the same as Join, underlining the association is nothing but a join but a bit on optimize way and having with some added feature.

-Association makes a relationship from source to target with cardinality. Cardinality tells that the possible number of data records mapped with the single-source record. Cardinality always gives meaning to Target data sources.

**Syntax : <Source> association [<cardinality>] to <Target> as <Association Name>
        on $Projection.<Field_Name> = <Association Name>.<Field Name>**


, Filters, Parameters, Extensibility
# Analytical CDS: Aggregations, Hierarchies, Cube & Dimension Views
# SQL Performance Tuning: HANA Execution Plan, SQL Analyzer, Explain Plan
# Hands-on: Develop a CDS view with associations, Use it in an ABAP program, Implement an AMDP method.
