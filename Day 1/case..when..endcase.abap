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
