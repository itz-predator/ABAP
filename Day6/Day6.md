# Day 6: Object-Oriented ABAP, Enhancements & BTP
# OOP ABAP: 
- OOPS in ABAP stands for Object-Oriented Programming (OOP) in Advanced Business Application Programming. 
- It refers to the adoption of object-oriented principles and features within the ABAP programming language, which is primarily used for developing applications in SAP’s ERP (Enterprise Resource Planning) systems.
## Features of OOPS ABAP :
- Encapsulation : Encapsulation in ABAP OOPS involves bundling data (attributes) and methods (procedures/functions) that operate on the data into a single unit (class).
- Data Abstraction : Abstraction in ABAP OOPS involves preventing the access of components of a class from outside the class by using visibility section.
- Inheritance : Using the components of one class into another class .
- Polymorphism : Polymorphism allows methods to be defined in multiple classes and overridden in subclasses. This enables different classes to provide different implementations of the same method signature, based on the context of the object.
## Class in OOPS ABAP
Classes serve as blueprints or templates from which objects, also known as instances, can be created at runtime.

- In Class we have two types :

### Local Class
- A Local class in ABAP is defined using the CLASS statement followed by the class name. For example:

CLASS <class_name> DEFINITION. 
.......... 
.......... 
ENDCLASS.
- The following syntax shows how to implement a class −

CLASS <class_name> IMPLEMENTATION. 
........... 
.......... 
ENDCLASS.
### 2. Global class

- Global classes are defined using the ABAP Class Builder (SE24 transaction) or through ABAP Development Tools (Eclipse-based IDE for SAP development). They are not tied to a specific program or function module but exist independently within the ABAP Dictionary.

### Attributes
- Attributes are variables that define the data properties of the class. They are declared in the class declaration . Attributes are declared using the DATA keyword within the DATA or TYPES sections of the class definition.

- These attributes can be divided into 2 categories:

## 1.Instance Attributes.
DATA <Attribute Name> TYPE <Data Type>

## 2. Static Attributes.

CLASS-DATA <Attribute Name> TYPE <Data Type>

## Methods
- A method is a function or procedure that represents the behavior of an object in the class . A method meth1 is declared in the declaration part of a class using the statements METHODS and CLASS-METHODS and implemented in the implementation part of the class using the processing block.

METHOD meth1.
…
ENDMETHOD.

## Instance Methods

- Instance methods are declared using the METHODS statement. They can access all the attributes of a class and can trigger all its events.

## Static Methods

- Static methods are declared using the CLASS-METHODS statement. This statement can access static attributes of a class and is can trigger static events only.

## Constructors

- As well as the normal methods that are called explicitly, there are two special methods called constructor and class-constructor, which are called automatically when an object is created or when a class component is accessed for the first time.

### Types of Constructors in SAP ABAP

## 1.Instance Constructors: These are used to initialize instance variables of an object when it is created. In SAP ABAP, instance constructors are defined using the keyword CONSTRUCTOR.
CLASS lcl_example DEFINITION.
PUBLIC SECTION.
METHODS: constructor.
ENDCLASS.

CLASS lcl_example IMPLEMENTATION.
METHOD constructor.
“ Initialize instance variables here
ENDMETHOD.
ENDCLASS.

## 2) Class Constructors (Static Constructors): These are used to initialize class-level data or perform actions that should occur once when the class is first accessed. In SAP ABAP, class constructors are defined using the keyword CLASS_CONSTRUCTOR.

CLASS lcl_example DEFINITION.
PUBLIC SECTION.
CLASS-METHODS: class_constructor.
ENDCLASS.

CLASS lcl_example IMPLEMENTATION.
CLASS-METHOD class_constructor.
“ Initialize class-level data here
ENDMETHOD.
ENDCLASS.

### Visibility Section

- In an ABAP class, you can have three visibility sections PUBLIC SECTION, PROTECTED SECTION, PRIVATE SECTION.
- There is no default visibility section. Hence, you must declare at least one of the three visibility section when defining ABAP Class.
- All components of the class will belong to one of the three visibility sections.
- You have to define the visibility section in the sequence, PUBLIC SECTION, PROTECTED SECTION and PRIVATE SECTION.

  ## The Object Oriented Programming has three major Component around which i revolves. They are:


### Polymorphism
### Encapsulation
### Inheritance

## 1.Polymorphism: In simple terms when you over write some functionality it's called polymorphism. In polymorphism, you can inherit methods from the parent class and can modify it by implementing it again (which is nothing but implementation of the inherited method).
## 2.Encapsulation : Wrapping up of data into single unit. Or, restriction on visibility of attributes and methods in the class. We have 3 levels of visibility:

    -  1. Private

   -   2. Protected

   -  3. Public

- Methods or attributes defined as private are only visible and available to the class in which they are defined.

- Methods or attributes defined as protected are visible to the class defined in and to the class which inherits from the class they are defined in.

- Similarly the methods or attributes defined as public are available to all.

  ## 3.Inheritance: This can be defined from the word itself. That is to inherit properties from some parent class. Anything inherited will only be cisible if that is declared as public or protected in the super class.


- Normally the OBJECT ORIENTED ABAp does not support the many to one inheritance, but this is made possible by using interfaces.


- Interface is also a kind of class which contain the definitions only. Implementation of those defined methods will take part in the deriving classes only.


# Enhancements: BAdIs, Customer Exits
- Enhancement is a way to add or change the SAP object functionality without modifying the SAP object.
- SAP object is the object that is delivered or created by SAP.
- Customer object is the object that is created by a customer.
  ## Below are the types of enhancement available in SAP
- Data dictionary enhancement

- Customer Exit

- BADI

  
  ### Data dictionary enhancement


- We can enhance SAP standard table or structure by using two ways,
- 1.Append structure
- 2.Customising include
  - Append structure and customising include allow us to enhance SAP standard tables or structures by adding fields to them.
     - ![image](https://github.com/user-attachments/assets/5555d444-5cfc-4ce0-8d32-6b510b72ff9d)
- We can enhance table or structure by using customising include only if the table or a structure has customising include Statement.
- ![image](https://github.com/user-attachments/assets/b70c93be-4930-489b-8010-b0d65224aae4) 

- Note :- Use – If there is a requirement to save some additional fields.
### Customer Exit


- Customer exit is one type of SAP enhancement. With customer exit we can enhance the SAP standard program without modifying SAP Object.


- There are three type of customer exit -




- 1.Functional Exit

- 2.Menu Exit

- 3.Screen Exit

###  - We can see the list of customer exit by transaction code SMOD.




- 1.Debuging the program and create a breakpoint for command call customer function.

- 2.Search in program “call customer-function”.

- 3.Use transaction SMOD

  - ![image](https://github.com/user-attachments/assets/dd1bd6e0-549f-404d-9912-eb0655fd2c2e)

    - Use-> If there is a requirement to apply some validation on field, want to substitute values during the posting or need some additional screen during any transaction etc.

### Business Add-in (BADI)


-When SAP developers were creating SAP standard program, they found that customer may need different logic in the future, So they created BADI and also an interface.




- BADI is based on object-oriented programming.

- We can see list of existing BADI by t code SE18.

- We can implement the BADI by t code SE19.


- We can search BAdI Name is used for classical and Enhancement spot used for new.


- You can check the documentation related to BAdI and used those as per your requirement.
- ![image](https://github.com/user-attachments/assets/f006d3ba-6336-485e-9b41-f6b3c51c4689)
- ![image](https://github.com/user-attachments/assets/1d727919-80d9-4245-a2b9-384b6b2f541b)

- Click on display, we can check if this BAdI is already implemented or not.


- There is a tab in header “Implementation”  , click on that then display.
- ![image](https://github.com/user-attachments/assets/5bd826e9-699e-4aa8-8db4-f182ba81a180)
- So this BAdI is already implemented as we can clearly see above.


- Use-> Can be used widely to apply additional logic in sap standard program like applying payment block based on certain business requirement as shown above.

 ## Implicit/Explicit Enhancements, 
 - Enhancement points are basically hooks at certain defined points within the ABAP code i.e. at the beginning and end of a FORM.
 - These hooks allow you to attach your own custom code which will be executed as if it had been hard coded into the code using a modification.
   ### There are 2 types of enhancements with the enhancement framework:
### 1.Implicit enhancements are **predefined by the system** at specific points (like the start or end of a function or method).
- With implicit enhancements, you are limited to **where the system allows you to add modifications**.
- Implicit enhancements are used for **small tweaks** in predefined places within standard processes.
- Implicit enhancements are like jumping onto a bus route that already exists.
  ### 2.Explicit enhancements are **manually defined by developers** wherever additional functionality might be needed in the future.
  - In explicit enhancements, **you have full control** to decide where new enhancement points should be created.
  - Explicit enhancements are ideal when you **plan for future flexibility** and want to build modification points proactively.
  - Explicit enhancements are like creating your own bus stop where it’s most convenient for you.
 ## Enhancement Spots 
 - Enhancement spots are containers for explicit enhancement options and carry information about the positions at which enhancement options were created.
 - One enhancement spot can manage several enhancement options of a repository object and vice versa; several enhancement spots can be assigned to one enhancement option.
# SAP BTP Overview: ABAP Environment, Cloud Foundry, Key Use Cases
# Hands-on: Implement a Custom BAdI in Procurement Process, Deploy an ABAP Cloud application on BTP.
