# Day 3: Abap reports,ALV, OData & RAP
## Abap reports:
-In ABAP, there are a total of 7 types of reports. They are:
## 1.Classical
- These are the most simple reports. 
- Programmers learn this one first. 
- It is just an output of data using the Write statement inside a loop.
- Classical reports are normal reports. These reports are not having any sub reports. 
- IT IS HAVING ONLY ONE SCREEN/LIST FOR OUTPUT.
# **Events In Classical Reports.**

### 1.INTIALIZATION: This event triggers before selection screen display.
### 2.AT-SELECTION-SCREEN: This event triggers after proccesing user input still selection screen is in active mode.
### 3.START OF SELECTION: Start of selection screen triggers after proceesing selection screen.
### 4.END-OF-SELECTION : It is for Logical Database Reporting.

## 2.Interactive
- As the name suggests, the user can Interact with the report.
- We can have a drill down into the report data. For example, Column one of the report displays the material numbers, and the user feels that he needs some more specific data about the vendor for that material, he can HIDE that data under those material numbers.
- And when the user clicks the material number, another report (actually sub report/secondary list) which displays the vendor details will be displayed.
- We can have a basic list (number starts from 0) and 20 secondary lists (1 to 21).

### Events associated with Interactive Reports are:

- AT LINE-SELECTION
- AT USER-COMMAND
- AT PF<key>
- TOP-OF-PAGE DURING LINE-SELECTION.
**HIDE statement holds the data to be displayed in the secondary list.
sy-lisel : contains data of the selected line.
sy-lsind : contains the level of report (from 0 to 21)**

### Interactive Report Events:

- AT LINE-SELECTION : This Event triggers when we double click a line on the list, when the event is triggered a new sublist is going to be generated. Under this event what ever the statements that are been return will be displayed on newly generated sublist.
- AT PFn: For predefined function keys...
- AT USER-COMMAND : It provides user functions keys.
- TOP-OF-PAGE DURING LINE-SELECTION :top of page event for secondary list.


## 3.Logical Database
- Logical database is another tool for ABAP reports. Using LDB we can provide extra features for ABAP reports.

- While using LDB there is no need for us to declare Parameters.

- Selection-screen as they will be generated automatically.

- We have to use the statement NODES in ABAP report.

- If there are many tables the Performance will be slow as all the table data will be read from top node to bottom node .
## 4.ABAP query
- ABAP query is another tool for ABAP. It provides efficency for ABAP reports. These reports are very accurate.
- Transaction Code : SQ01
## 5.ALV Reports (ALV stands for ABAP List Viewer)
- ALV means ABAP List Viewer. Most convenient way to use it is through reuse library (cf. transaction se83) available from release 4.6 of SAP R/3.

- ALV is available in two modes: list and grid.
- List mode is good old list processing with standard functionnalities
- Grid mode is using a new OCX object displaying grids 
## 6.Report Writer/Report Painter
- Report Writer
### Key Concept :

- Super users and end users can use Report Painter/Report Writer tools to write their own reports.

- Giving them the ability to report on additional fields at their discretion shifts the report maintenance burden to them, saving SAP support groups time and effort normally spent creating and maintaining the reports.

- Instead of using ABAP code to write a report in FI and CO, many users build a Report Painter/ Report Writer library using transaction MC27.

- However, this workaround has some drawbacks. Little known transaction GRCT solves these problems in most cases, and eliminates the need to use transaction MC27.

## 7.Views (There are different types of views also)
- A view can be used in ABAP programs for data selection.
- The data of a view is derived from one or more tables, but not stored physically.
- The simplest form of deriving data is to mask out one or more fields from a base table (projection) or to include only certain entries of a base table in the view (selection).
# ALV Reports: Classic ALV (REUSE_ALV_LIST_DISPLAY, REUSE_ALV_GRID_DISPLAY),
- ALV Report is one of the many ways of displaying SAP table data in a reporting manner.
- Acronym ALV stands for ABAP List Viewer. ALV Report in SAP ABAP are very commonly used in many standard and custom SAP transaction across different SAP modules.

## ALV reports include below in-built functions:

- Sorting of records.
- Filtering of records.
- Totaling of records when there is a quantity column.
- Sub totaling of records when there is a quantity column.
- Hiding columns.
- Changing order of columns.
- Downloading report in Excel or HTML format.
 ### REUSE_ALV_LIST_DISPLAY
 - It is not possible to give the title
 - Row editing is not possible
 - when we use this fun module,then it is like a static list, means, u cannot do these operations

-- hide

-- change the order of coloumns

-- total

-- grid title


 ### REUSE_ALV_GRID_DISPLAY
 - we can give the title
 - Row editing is possible
_These operation are possible in grid _
-- hide

-- change the order of coloumns

-- total

-- grid title

# OOP-based ALV
- https://help.sap.com/docs/SUPPORT_CONTENT/abap/3353525697.html
  
- OData Services: Architecture, Basic CRUD Operations, SEGW Transactions
- RESTful ABAP Programming Model (RAP): Key Features, Behavior Definitions, Actions
- Annotation Concepts: UI Annotations, Analytical Annotations in RAP
- Hands-on: Create an ALV report with sorting and totals, Expose an OData service, and Create a
simple RAP-based app.

