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
