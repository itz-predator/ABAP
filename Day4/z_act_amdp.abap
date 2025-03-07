REPORT z_act_vendor_amdp.

TYPES: BEGIN OF ty_vendor,
         lifnr        TYPE lifnr,
         bukrs        TYPE bukrs,
         ekorg        TYPE ekorg,
         name1        TYPE name1,
         city1        TYPE adrc-city1,
         region       TYPE adrc-region,
         country      TYPE adrc-country,
         post_code1   TYPE adrc-post_code1,
       END OF ty_vendor.
DATA: gt_vendors TYPE SORTED TABLE OF ty_vendor WITH NON-UNIQUE KEY lifnr bukrs ekorg.

GET RUN TIME FIELD DATA(gv_start).
DATA(go_ref) = NEW zcl_act_vendor_amdp( ).

go_ref->get_vendors_amdp( EXPORTING lv_clnt = sy-mandt
                          IMPORTING lt_vendor = gt_vendors ).

GET RUN TIME FIELD DATA(gv_end).
DATA(gv_time) = gv_end - gv_start.

cl_demo_output=>display_data( value = gt_vendors
                              name  = |Duration { gv_time }ms| ).
