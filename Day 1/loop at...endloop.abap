Data : lt_data type table of i,
lv_val type i.
Append 10 to lt_data.
append 20 to lt_data.
append 30 to lt_data.

Loop At lt_data into lv_val.
write : / lv_val.
endloop.
