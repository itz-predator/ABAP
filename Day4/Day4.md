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
### There are three types of views :

- 1.Basic : these are used to bring data directly from the physical tables in the database.
- 2.Composite : this type of view is used to link basic views together through associations (like SQL joins between views). They are then used by the consumption views.
- 3.Consumption : these views allow you to create a specific query from a “composite” view. This is the only type of view that can be exposed to the OData or transient service to be consumed for reporting.

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

- Association makes a relationship from source to target with cardinality. Cardinality tells that the possible number of data records mapped with the single-source record. Cardinality always gives meaning to Target data sources.

**Syntax : <Source> association [<cardinality>] to <Target> as <Association Name>
        on $Projection.<Field_Name> = <Association Name>.<Field Name>**
- ![image](https://github.com/user-attachments/assets/9389d10c-1d93-4f3a-8cd1-2cc322f6532c)

- Points to be noted that it is advisable to use the association name preceding with _.
- If you place the association name in the output then prerequisite to include the join condition fields in the output field list(in the above case it is employee_id).
### Cardinality: Cardinality tells how the Target data are mapping with Source data. Below are different cardinality
- ![image](https://github.com/user-attachments/assets/6f573671-efe9-42cf-8138-7a93b353f778)



## Filters 
- To adjust the result set of a custom CDS view, you can define a condition, similar to the SQL WHERE clause, using the expression-based editor or the form-based editor.
- When the custom CDS view is accessed, the result set contains only the data that meets the defined condition.
- You can use the form-based version to define simple filter conditions.
- These filter conditions are reflected in the expression-based version of the filter editor in case you want to define more complex conditions.
### Parameter Binding
- Parameter binding must be considered when fields from an associated data source containing parameters are used in calculations and filters. An example:

- When a field is added to the expression-based editor using the field list or the value help, the field will look as follows:

- _I_Aps_Cke_Epm_Country_P( p_language: value, P_BusinessUser: value ).Country

- You then need to provide the required parameter values using the 'value' placeholder for the parameters added to the path of the field. The resulting field with parameter values would therefore look as follows:

- _I_Aps_Cke_Epm_Country_P( p_language: p_langu, P_BusinessUser: $session.user ).Country


  


## Parameters
- A parameterized CDS view is a CDS view that accepts input parameters to filter data at the database level.
- This avoids fetching unnecessary data and improves performance. Parameters are defined in the CDS view itself and must be passed explicitly at runtime when queried.
- Example of Parameterized CDS View Definition: Here’s an example of a parameterized CDS view that retrieves accounting document data from the BKPF table:
- ![image](https://github.com/user-attachments/assets/17e3cea7-f3fe-4841-936b-d43163da8146)
- In this CDS view:

- p_company_code : Filters by company code.
- p_fiscal_year : Filters by fiscal year.
- Consuming Parameterized CDS Views in ABAP
- To consume this CDS view, we write an ABAP program that accepts user inputs, queries the CDS view with the parameters, and displays the data.

### Key Steps:

- Prompt for Parameter Inputs: Use a selection screen to collect parameter values (e.g., company code and fiscal year).
- Pass Parameters to the CDS View: Use the Select statement with parameter syntax to query the CDS view.
- Display Results: Use CL_DEMO_OUTPUT or other techniques to display the fetched data.
- ![image](https://github.com/user-attachments/assets/c2e6685c-a783-45af-ab93-c7d494c87579)
- ![image](https://github.com/user-attachments/assets/91b9ef64-6f36-4dda-a625-f9d622923906)
- ![image](https://github.com/user-attachments/assets/1636ac94-1407-45ad-9ada-9b2824a70667)

- Key Points to Note :
- 1.Parameterized Syntax:
- Always use the @ symbol to reference ABAP variables in SQL statements when passing parameters to the CDS view

- 2. Runtime Inputs:

- Use Parameters for easy input handling on the selection screen.

- 3. Error Handling

- Check for empty inputs or no results and provide meaningful feedback to users.
  


## Extensibility
- Extensibility allows customers to adopt standard business software to their business requirement and it offers more convenience for customers in their end to end scenarios.

- To achieve this we need to prepare suitable extension points by defining corresponding DDIC artefacts, registering extension options and preparing application code for dealing with the extended structures at runtime. It is applicable for both on-premise and cloud customers.
- https://community.sap.com/t5/application-development-blog-posts/implementation-of-cds-extensibility-for-s-4-hana/ba-p/13357636
  
## Analytical CDS:
- An analytical projection view is a transient CDS entity. That means that only a runtime object on the ABAP server is generated. No SQL view is created on the database. Therefore, an analytical projection view can be used only by the analytical runtime. An analytical projection view can't be used as data source of other CDS entities. Access with ABAP SQL is not possible.
 ## Hierarchies, Cube & Dimension Views
- - ![image](https://github.com/user-attachments/assets/8eb5080a-3097-41cd-a297-3a4231902bfb)
  - 

## Aggregations
- Aggregation is a function that is applied to a column in a view. Aggregate functions like COUNT , MAX , MIN and AVERAGE can be automatically calculated on any column within the view.
- These functions will automatically update as the underlying data updates. Note that all views use the same underlying data.
- https://help.sap.com/doc/saphelp_nw75/7.5.5/en-US/5e/5d319bd1a74552b99a36dfc739f74d/content.htm?no_cache=true
  
# SQL Performance Tuning:
## Query Optimization
- Analyze how the database executes your query.
  - Example in SAP HANA
  - EXPLAIN PLAN FOR SELECT * FROM orders where  order_date>'2024-01-01';
## Optimize Where clause
- Avoid unnecessary conditions.
- Use index columns in WHERE Clauses.
- Avoid LIKE '%value%' as it prevents index usage .
## Avoid Select *
- Fetch only required columns.
  
# HANA Execution Plan,  Explain Plan
- https://help.sap.com/docs/SAP_HANA_PLATFORM/bed8c14f9f024763b0777aa72b5436f6/c0d42fd3bb571014a0688254f3de593f.html
# SQL Analyzer
- The tool can be used to view detailed information on each query execution and can help you evaluate potential bottlenecks and optimizations

# Hands-on: 
# Develop a CDS view with associations:->
## 1.ZRS1_CDS_ASSOCIATION
## 2. Use it in an ABAP program -> ZRS1_CDS_CONSUME
# Implement an AMDP method:->
## 1. Create a CDS VIEW -> ZPO_HEADER_CDS
## 2. Create a AMDP Class for CDS Processing  -> ZCL_AMDP_PO_PROCESSOR
## 3. Create a ABAP Program to implement AMDP Class -> ZPO_AMDP_TEST
- Refer to code and images -DAY4/
