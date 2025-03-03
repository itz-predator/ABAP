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

