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
-In Abap control structure help in managing the flow of execution within a program .
They include conditional statements ,loop constructs ,and branching statements .

# 1 Conditional Statements 
-These are used to execute different code blocks based on conditions.

# a. IF...ELSEIF...ELSE...ENDIF

-Used for conditional execution based on expressions.
# Example code 
Data : lv_val type i value 10.

if lv_val > 10.
Write : 'Value is greater than 10'.
elseif lv_val = 10.
Write : 'Value is equal to 10'.
else.
Write : 'Value is less than 10'.
Endif.

# b. case...when...endcase
-used when multiple conditions exist for a single variable .
# Example code 
Data : lv_grade type char1 value 'B'.

Case lv_grade.
When 'A'.
Write : 'excellent'.
When 'B'.
Write : 'Good '.
When 'C'.
Write : 'Average'.
When Others.
Write : 'Needs improvement'
Endcase.

# 2 Loops Construct 
-Used to execute a block of code multiple times.
# a.Do...Enddo
-Executes the bllock indefinately unless explictly exited.

# Example Code 
Data : lv_count type i value 1.
Do.
Write : / lv_count.
lv_count = lv_count + 1.
If lv_count > 5.
Exit. "Exit the loop
Endif.
Enddo.


# b. While...endwhile
-Executes as long as the condition is true .

# Example Code 
Data : lv_count type i value 1.
While lv_count <= 5.
write :/ lv_count .
lv_count = lv_count + 1.
endwhile.

# c. Loop At...Endloop
-Used to iterate over internal tables .

# Example Code 
Data : lt_data type table of i,
lv_val type i.
Append 10 to lt_data.
append 20 to lt_data.
append 30 to lt_data.

Loop At lt_data into lv_val.
write : / lv_val.
endloop.

# 3 Branching Statements
- these statements help control the execution flow inside loops.
- EXIT -Exits the loop immediately.
- Continue - Skips the current iteration and proceeds to the next .
- CHECK - Skips an iteration if the condition is false.

# Example code
Data : lv_count type i value 0.
DO 10 times.
lv_count + = 1.
if lv_count = 5.
Continue.
Endif.
write: / lv_count.
if lv_count = 8.
exit.
endif.
enddo.

# Example with Check
Data : lv_num type i.
Do 10 times.
lv_num = sy-index.
check lv_num MOD 2 = 0.
Write : / lv_num.
enddo.

# Control Break Statement 
Control Break Statements (At new, At first, At end of , At last) are mainly used to calculate the SUMS and Totals on a Particular field.

Have to sort the ITAB first by that fields on which you need totals.

They are used in proceesing of a internal table.

# See the sample Code:

DATA: sflight_tab TYPE SORTED TABLE OF sflight
WITH UNIQUE KEY carrid connid fldate,
sflight_wa LIKE LINE OF sflight_tab.
SELECT *
FROM sflight
INTO TABLE sflight_tab.
LOOP AT sflight_tab INTO sflight_wa.
AT NEW connid.
WRITE: / sflight_wa-carrid,
sflight_wa-connid.
ULINE.
ENDAT.
WRITE: / sflight_wa-fldate,
sflight_wa-seatsocc.
AT END OF connid.
SUM.
ULINE.
WRITE: / 'Sum',
sflight_wa-seatsocc UNDER sflight_wa-seatsocc.
SKIP.
ENDAT.
AT END OF carrid.
SUM.
ULINE.
WRITE: / 'Carrier Sum',
sflight_wa-seatsocc UNDER sflight_wa-seatsocc.
NEW-PAGE.
ENDAT.
AT LAST.
SUM.
WRITE: / 'Overall Sum',
sflight_wa-seatsocc UNDER sflight_wa-seatsocc.
ENDAT.
ENDLOOP.


###  Modularization: 
# Subroutines :
-A subroutine is a reusable section of code. It is a modularization unit within the program where a function is encapsulated in the form of source code.
-A subroutine can be defined using Form and EndForm statements.
-We can call a subroutine by using PERFORM statement.
# Example of Passing Parameters by Reference


REPORT demo_pass_by_ref.

DATA: num1 TYPE i,
      num2 TYPE i,
      sum  TYPE i.

num1 = 2. num2 = 4.
PERFORM addit USING num1 num2 CHANGING sum.

num1 = 7. num2 = 11.
PERFORM addit USING num1 num2 CHANGING sum.

FORM addit
       USING add_num1   TYPE any
             add_num2   TYPE any
       CHANGING add_sum TYPE any.

  add_sum = add_num1 + add_num2.
  PERFORM out USING add_num1 add_num2 add_sum.

ENDFORM.

FORM out
       USING out_num1 TYPE any
             out_num2 TYPE any
             out_sum  TYPE any.

  WRITE: / 'Sum of', out_num1, 'and', out_num2, 'is', out_sum.

ENDFORM.

This produces the following output:

Sum of          2 and          4 is          6

Sum of          7 and         11 is         18

In this example, the actual parameters num1, num2, and sum are passed by reference to the formal parameters of the subroutine addit. After changing add_sum, the latter parameters are then passed to the formal parameters out_num1, out_num2, and out_sum  of the subroutine out.

Input parameters that are changed in the subroutine are also changed in the calling program. To prevent this, you must pass the parameter as a value in a USING addition.

# Example of Passing Parameters by Value


REPORT demo_pass_by_val.

DATA: num  TYPE i VALUE 5,
      fac  TYPE i VALUE 0.

PERFORM fact USING num CHANGING fac.

WRITE: / 'Factorial of', num, 'is', fac.

FORM fact
       USING value(f_num) TYPE i
       CHANGING f_fact    TYPE i.

  f_fact = 1.
  WHILE f_num GE 1.
    f_fact = f_fact * f_num.
    f_num = f_num - 1.
  ENDWHILE.

ENDFORM.

This produces the following output:

Factorial of          5 is        120

To ensure that an input parameter is not changed in the calling program, even if it is changed in the subroutine, you can pass data to a subroutine by value. In this example, the factorial of a number num is calculated. The input parameter num is passed to the formal parameter f_num of the subroutine. Although f_num is changed in the subroutine, the actual parameter num keeps its old value. 

# Function Modules:
-Function modules are ABAP routines that encapsulate program code and provide an interface for data exchange. 
-Function modules are stored in a central function library. 
-They are not application-specific and are available system-wide. 
-The ABAP Workbench comes with a large number of standard function modules.

# Features
## Main Features

The main features of function modules are:

-They belong to a pool called a function group.
-They possess a fixed interface for data exchange. This makes it easier for you to pass input and output parameters to and from the function module. For example, you can assign default values to the input parameters. 
-The interface also supports exception handling. This allows you to catch errors and pass them back to the calling program for handling.
-You call a function module by name (which must be unique) in a CALL FUNCTION statement.

# Function Groups

-Function groups (also called function pools) are ABAP programs of a special type. 
-They are the only program type that can contain function modules. Function modules are, in turn, procedures with public interface and are designed to be used by other programs. 
-Function groups can contain global data declarations and subroutines that are available to all function modules in the group. 
-In terms of object-oriented programming, a function group resembles a class and the function modules are its public static methods.
# Function Builder (SE37)
-Function Modules are created, modified, and managed using the Function Builder (transaction SE37).
-Within the Function Builder, you may create import/export arguments, exceptions, and documentation.
-Function Modules can be customized to add or change functionality.
-Function Exit, BAdI (Business Add-Ins), and other approaches are used for enhancements.
### Types of FM's
# The type of function module depends on the Processing Type.

# 1.Regular Function Module
-A Regular Function Module is the default option. This kind of Function Module is executed immediately and synchronously on your current SAP system.

CALL FUNCTION func { parameter_list | parameter_tables }. 
# 2.Remote-Enabled Function Module
-Remote Function Modules can be called by other SAP and non-SAP systems utilizing the RFC protocol.

-For example, you can define a Remote Function Module in an EWM system which then gets called by your ERP system to get further information about stock levels or shipment details.

CALL FUNCTION func DESTINATION dest parameter_list. 
-This statement calls the target system specified under dest synchronously. Available RFC destinations are configured using transaction SM59. Use the unique name of a destination for parameter dest.

-The calling program continues execution once the RFC has finished. Depending on the connection this can be a performance issue.

# 3.Update Function Module
-Update Function Modules are not executed immediately. They are scheduled for execution in an update work process. This update process is triggered by the statement COMMIT WORK. The statement ROLLBACK WORK deletes all update function module registrations.

CALL FUNCTION update_function IN UPDATE TASK 
                              [EXPORTING p1 = a1 p2 = a2 ...] 
                              [TABLES t1 = itab1 t2 = itab2 ...]. 
Using CALL FUNCTION .. IN UPDATE TASK is a way to bundle database changes into a single database LUW. It is also beneficial for performance since the update happens asynchronously.

# What is a BAPI?
-SAP BAPI stands for Business Application Programming Interface. Technically a BAPI is a Function Modules that offers a standard interface to business objects in SAP. Most of them are also RFC enabled.

-Common use-cases are using a BAPI to create/read/update/delete business objects like Sales Orders, Business Partners, or Purchase Orders.

-Those BAPIs behave like the SAP standard transactions for these business objects. This means that authorization checks are already in place and implemented user exits are considered.




### Classes & Methods: 
# Class (SE24)
-A Class is used to encapsulate data and behavior.
-A class is an abstract description of an object. 
-You could say that it is a set of instructions for building an object. 
-The attributes of objects are defined by the components of the class, which describe the state and behavior of objects.
- Classes in ABAP Objects can be declared either globally or locally.
-You define global classes and interfaces in the Class Builder (Transaction SE24) in the ABAP Workbench.
-All ABAP programs have access to these global classes. Local classes are defined within an ABAP program.
-Local classes and interfaces can only be used in the program in which they are defined.

## Structure of a Class

### The following statements define the structure of a class:

- Attributes (variable)
- Methods (functions or procedures)
- Events
- Interfaces
## Types of Classes
-1. **Local Classes (Defined within a program(eg, reports, fm's))**
-2. **Global Classes (Defined in SE24 (_Class Builder_) or _Eclipse_ and reusable across different programs)**

### Syntax 

CLASS lcl_test DEFINITION.
PUBLIC SECTION.
DATA : gv_num TYPE i.
METHODS: display_num.
ENDCLASS.
CLASS lcl_test IMPLEMENTATION.
METHOD display_num.
WRITE: gv_num.
ENDCLASS.


# Methods(SE24)
-**Methods define the behavior of a class and can be instance methods or static methods .**

## Defining a Method 
**
METHODS method_name [IMPORTING parameters]
                  [EXPORTING parameters]
                  [CHANGING parameters]
                  [RETURNING VALUE(result) TYPE data_type].**


## Types of Methods 
- 1. **Instance Methods (default)** -Works on instance attributes ,requires an object .
- 2. **Static Methods (CLASS_METHODS)** - called without creating an object , used for utility functions.

### Example of Instance and Static Methods .

CLASS lcl_test DEFINITION.
  PUBLIC SECTION.
    DATA: gv_text TYPE string.
    
METHODS: 
      set_text IMPORTING iv_text TYPE string,
      display_text.
      
CLASS-METHODS: static_method.
ENDCLASS.
 
CLASS lcl_test IMPLEMENTATION.
  METHOD set_text.
    gv_text = iv_text.
  ENDMETHOD.
  
  METHOD display_text.
    WRITE: gv_text.
  ENDMETHOD.
 
  METHOD static_method.
    WRITE: 'This is a static method'.
  ENDMETHOD.
ENDCLASS.
 
* Creating Object and Calling Methods
DATA(lo_demo) = NEW lcl_demo( ).
lo_demo->set_text( 'Hello, ABAP OOP!' ).
lo_demo->display_text( ).
 
* Calling Static Method
lcl_demo=>static_method( ).

## Inheritance in ABAP
-A class can inherit from another using INHERITING FROM.

### Example code 
CLASS lcl_parent DEfINITION.
PUBLIC SECTION.
METHODS: parent_method.
ENDCLASS.

CLASS lcl_parent IMPLEMENTATION.
METHOD parent_method.
WRITE: 'Parent Method'.
ENDMethOD.
ENDCLASS.

DATA(lo_child) = new lcl_child().
lo_child -> parent_method(). " Inherited Method
lo_child -> child_method(). "Child class method 

## Constructor Method 
-It initializes an object automatically upon creation.

### Example code 

CLASS lcl_test DEFINITION.
PUBLIC SECTION.
DATA : gv_mess TYPE String.
METHODS: constructor IMPORTING iv_mess TYPE String.
ENDCLASS.

CLASS lcl_test IMPLEMENTATION.
METHOD constructor.
gv_mess = iv_mess.
WRITE: gv_mess.
ENDMETHOD.
ENDCLASS.

DATA(lo_obj) = NEW lcl_test('Welcome to OOABAP').

## Friend Classes (granting Access)
- One Class xan access private attributes of another class using FRIENDS.

###  Example Code

CLASS lcl_friend DEFINITION.
PUBLIC SECTION.
FRIENDS: lcl_main.
PRIVATE SECTION.
DATA: gv_secret TYPE string VALUE 'HIDDEN DATA'.
ENDCLASS.
CLASS lcl_main IMPLEMENTATION.
METHOD show_secret.
DATA(lo_friend) = NEW lcl_friend().
WRITE: lo_friend -> gv_secret. " Accessing Private Attribute
ENDMETHOD.
ENDCLASS.
DATA(lo_main) = NEW lcl_main().
lo_main -> show_secret().



 


                  










# S/4HANA Basics: Differences from ECC, 
# Simplifications (e.g., Material Ledger, Business Partner)
# HANA Architecture: Column Store, Row Store, Code Pushdown Concept
# Data Dictionary (DDIC): Tables, Views, Domains, Search Helps, Lock Objects
# Hands-on: Create a transparent table and fetch data using Open SQL.
