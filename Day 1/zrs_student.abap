REPORT ZRS_STUDENT.
Data : it_stu type table of zrs_student,
       wa_stu type zrs_student.
       
SELECT * FROM zrs_student into table it_stu.
IF it_stu IS NOT INITIAL.
LOOP AT it_stu INTO wa_stu.
Write: / 'Student ID',wa_stu-S_ID,
       / 'Student Name', wa_stu-S_NAME,
       / 'Student Address',wa_stu-S_ADDRESS.
ENDLOOP.
ELSE.
WRITE: /'Data Not Found'.
ENDIF.
