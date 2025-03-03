### Day 1: ABAP Fundamentals & S/4HANA Basics
# ABAP Basics: 
# Data types: 
# 1.Data Element 
- Data elements in ABAP Dictionary describe individual fields. They are the smallest indivisible units of the complex types described below, and are used to specify the types of columns in the database. Data elements can be elementary types or reference types.

- Elementary types
Elementary types are part of the dual-level domain concept for fields in ABAP Dictionary. The elementary type has semantic attributes, such as texts, value tables, and documentation, and has a data type. There are two different ways to specify a data type:

- By directly assigning an ABAP Dictionary type.
You can assign a predefined ABAP Dictionary type and a number of characters to an elementary type.

1.Byte field	X
2.Text field	C
3.Integer	I
4.Floating point	F
5.Packed number	P
6.Text string	STRING
7.DATS Date D
8. ......There are more but most used in abap programming are this only 

# Example 
data: num1 type i value = '5'.
write :/ num1.
# 2.Structure 
A structure is a sequence of any other data types from ABAP Dictionary, that is, data elements, structures, table types, or database tables. When you create a structure in the ABAP Dictionary, each component must have a name and a data type.

In an ABAP program, you can use the TYPE addition to refer directly to a structure.

If you define a local data type in a program by referring to a structure as follows:

TYPES dtype TYPE structure.

# 3.Table Type
-Table types are construction blueprints for internal tables that are stored in ABAP Dictionary. When you create a table type in ABAP Dictionary, you specify the row type, access type, and key. The row type can be any data type from ABAP Dictionary, that is, a data element, a structure, a table type, or the type of a database table. You can also enter a predefined dictionary type directly as the row type, in the same way that you can with a domain.

-In an ABAP program, you can use the TYPE addition to refer directly to a table type.

-If you define a local data type in a program by referring to a table type as follows:

-TYPES dtype TYPE table.
Suppose the table type STRUCT_TABLE is defined in the dictionary with the row type STRUCT from the previous example. We can refer to the table type in ABAP:

TYPES table_type TYPE struct_table.

DATA: table_wa TYPE table_type,      line_wa  LIKE LINE OF table_wa.

...

LOOP AT table_wa INTO line_wa.  ...  WRITE: line_wa-col1, line_wa-col1, line_wa-col1.  ...ENDLOOP.

This program defines an internal table type table_type .

# Type Groups :
The definition of a type group is a fragment of ABAP code which you enter in ABAP Editor. The first statement for the type group pool is always:

# TYPE-POOL pool.

After that, you define data types using the statement TYPES. As before, It is also possible to define global constants using the CONSTANTS statement. All the names of these data types and constants must begin with the name of the type group and an underscore: pool_

In an ABAP program, you must declare a type group as follows before you can use it:

# TYPE-POOLS pool.

This statement allows you to use all the data types and constants defined in the type group pool in your program. You can use multiple type groups in the same program.

The type group HKTST is created as follows in the ABAP Dictionary:

TYPE-POOL hktst.

TYPES: BEGIN OF hktst_typ1,                col1(10) TYPE c,                col2 TYPE i,       END OF hktst_typ1.

TYPES hktst_typ2 TYPE p DECIMALS 2.

CONSTANTS hktst_eleven TYPE i VALUE 11.

This type group defines two data types HKTST_TYP1 and HKTST_TYP2, as well as a constant HKTST_ELEVEN with the value 11.

Any ABAP program can use this definition with the TYPE-POOLS statement:

TYPE-POOLS hktst.

DATA: dat1 TYPE hktst_typ1,      dat2 TYPE hktst_typ2 VALUE '1.23'.

WRITE: dat2, / hktst_eleven.

The output is:

1,23

11

The data types defined in the type group are used to declare data objects with the DATA statement and the value of the constant is, as the output shows, known in the program.

# Operators :
# 1.Arithmetic Operators in SAP ABAP-
# Example 
DATA: num1 TYPE I VALUE 10,
      num2 TYPE I VALUE 5,
      result TYPE I.
result = num1 + num2.  " Addition
result = num1 - num2. " Subtraction
result = num1 * num2. " Multiplication
result = num1 / num2. " Division
result = num1 MOD num2. " Modulus

# Comparison/ Relational Operators in SAP ABAP-

# Operator                             Function

=, EQ returns true If two operands are equal to each other

<>, NE returns true If two operands are not equal to each other

<, LT returns true If first operand is less than second.

>, GT returns true If first operand is greater than second.

<=, LE returns true If first operand is less than or equal to second.

>=, GE returns true If first operand is greater than or equal to second.

IS INITIAL returns true if the variable declared is not modified

IS NOT INITIAL returns true if the variable declared is modified

a BETWEEN b AND c (INTERVAL TEST) returns true if a lies in between b and c

# Example
DATA: value1 TYPE I VALUE 10,
      value2 TYPE I VALUE 20,
      result TYPE C LENGTH 1.
IF value1 EQ value2.
  result = 'X'. " True
ELSE.
  result = ' '. " False
ENDIF.

# for more on operators follow the link
# https://www.geeksforgeeks.org/operators-in-sap-abap/



# Control Structures (Loops, IF, CASE, DO, WHILE)



















Modularization: Subroutines, Function Modules, Classes & Methods, Local and Global Classes
S/4HANA Basics: Differences from ECC, Simplifications (e.g., Material Ledger, Business Partner)
HANA Architecture: Column Store, Row Store, Code Pushdown Concept
Data Dictionary (DDIC): Tables, Views, Domains, Search Helps, Lock Objects
Hands-on: Create a transparent table and fetch data using Open SQL.
