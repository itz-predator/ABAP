REPORT ZPO_AMDP_TEST.
DATA: lt_po_data TYPE ZCL_AMDP_PO_PROCESSOR=>TT_PO.

PARAMETERS: p_bukrs TYPE ekko-bukrs.
START-OF-SELECTION.
TRY.
"Call the AMDP METHOD
ZCL_AMDP_PO_PROCESSOR=>GET_PO_DATA(
EXPORTING iv_bukrs = p_bukrs
IMPORTING et_data = lt_po_data ).

"Display Result
cl_demo_output=>DISPLAY( lt_po_data ).
*LOOP AT lt_po_data into data(ls_po).
*WRITE: / ls_po-ebeln, ls_po-bukrs, ls_po-EKORG, ls_po-AEDAT.
*ENDLOOP.
CATCH CX_AMDP_ERROR INTO DATA(lo_amdp_err).
WRITE: / 'AMDP Execution Failed'.
lo_amdp_err->get_text( ).
ENDTRY.
