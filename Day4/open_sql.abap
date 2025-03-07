REPORT zact_vendor_osql.

SELECT a~lifnr,
       b~bukrs,
       c~ekorg,
       d~name1,
       d~city1,
       d~region,
       d~country,
       d~post_code1
  INTO TABLE @DATA(gt_vendor)
  FROM lfa1 AS a
  INNER JOIN lfb1 AS b ON b~lifnr = a~lifnr
  INNER JOIN lfm1 AS c ON c~lifnr = a~lifnr
  LEFT OUTER JOIN adrc AS d ON d~addrnumber = a~adrnr
  WHERE a~loevm EQ @abap_false
    AND a~sperr EQ @abap_false
    AND a~sperm EQ @abap_false
    AND a~node1 EQ @abap_false
    AND b~sperr EQ @abap_false
    AND c~loevm EQ @abap_false
    AND c~sperm EQ @abap_false.

GET RUN TIME FIELD data(lv_end_time).
DATA(lv_time) = lv_end_time - lv_start_time.

cl_demo_output=>display_data(EXPORTING value = gt_vendor 
                                       name = |Duration { lv_time } ms|.
