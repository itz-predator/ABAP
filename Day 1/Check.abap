Data : lv_num type i.
Do 10 times.
lv_num = sy-index.
check lv_num MOD 2 = 0.
Write : / lv_num.
enddo.
