Tables : sflight.
Data : fm_name TYPE rs38l_fnam.

*data : Begin of it_flttab occurs 0,
*        carrid type sflight-carrid,
*        connid type sflight-connid,
*        fldate type sflight-fldate,
*        seatsmax type sflight-seatsmax,
*        seatsocc type sflight-seatsocc,
*        End of it_flttab.

data : it_flttab like table  of sflight.
Data : g_salary type i .
*       it_flttab type standard table of ty_flt.
g_salary = 1000.


select carrid connid fldate seatsmax seatsocc from sflight into
corresponding fields of table it_flttab.

CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
  EXPORTING
    formname                 = 'ZTACA_SMFORM2'
*   VARIANT                  = ' '
*   DIRECT_CALL              = ' '
 IMPORTING
   FM_NAME                  = fm_name
 EXCEPTIONS
   NO_FORM                  = 1
   NO_FUNCTION_MODULE       = 2
   OTHERS                   = 3
          .
IF sy-subrc <> 0.
 MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
ENDIF.

call function fm_name
  Exporting
     salary = g_salary
  TABLES
     it_flttab = it_flttab
  EXCEPTIONS
    FORMATTING_ERROR           = 1
    INTERNAL_ERROR             = 2
    SEND_ERROR                 = 3
    USER_CANCELED              = 4
    OTHERS                     = 5           .

 IF SY-SUBRC <> 0.
 MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
 ENDIF.
