REPORT ztest_simple_adobe.
*&--------------------------------------------------------------------&
*  Declarations
*&--------------------------------------------------------------------&
TYPES:
      ty_outputparams TYPE sfpoutputparams, "Form Parameters for Form Processing
      ty_docparams    TYPE sfpdocparams.    "Form Processing Output Parameter
DATA:
      wa_outputparams TYPE sfpoutputparams,
      wa_docparams    TYPE sfpdocparams.
DATA:
      gv_fm_name      TYPE rs38l_fnam,
      gv_pernr        TYPE pa0001-pernr,
      gv_ename        TYPE pa0001-ename,
      gv_bukrs        TYPE pa0001-bukrs.
*&--------------------------------------------------------------------&
*  Selection-Screen
*&--------------------------------------------------------------------&
PARAMETERS:
      p_pernr       TYPE pa0001-pernr.


*&--------------------------------------------------------------------&
*  Start-Of-Selection
*&--------------------------------------------------------------------&
START-OF-SELECTION.

  " Sets the output parameters and opens the spool job
  wa_outputparams-device    =  'PRINTER'.
  wa_outputparams-dest      =  'LP01'.
  wa_outputparams-NODIALOG  = 'X'.
  wa_outputparams-preview   = 'X'.

  CALL FUNCTION 'FP_JOB_OPEN'
    CHANGING
      ie_outputparams = wa_outputparams
    EXCEPTIONS
      cancel          = 1
      usage_error     = 2
      system_error    = 3
      internal_error  = 4
      OTHERS          = 5.
  IF sy-subrc <> 0.
    " <error handling>
  ENDIF.
  " Get the name of the generated function module
  CALL FUNCTION 'FP_FUNCTION_MODULE_NAME'
    EXPORTING
      i_name     = 'ZOVH_SIMPLE_FORM'
    IMPORTING
      e_funcname = gv_fm_name.
  IF sy-subrc <> 0.
    "<error handling>
  ENDIF.

  wa_docparams-langu   = 'E'.
  wa_docparams-country = 'SG'.

  " Fetch the Data and store it in the Internal Table
  SELECT SINGLE pernr ename bukrs
    FROM pa0001
    INTO (gv_pernr, gv_ename, gv_bukrs)
    WHERE pernr EQ p_pernr.

  CALL FUNCTION gv_fm_name
    EXPORTING
      pernr          = gv_pernr
      ename          = gv_ename
      bukrs          = gv_bukrs
    EXCEPTIONS
      usage_error    = 1
      system_error   = 2
      internal_error = 3.

  " Close the spool job
  CALL FUNCTION 'FP_JOB_CLOSE'
    EXCEPTIONS
      usage_error    = 1
      system_error   = 2
      internal_error = 3
      OTHERS         = 4.
  IF sy-subrc <> 0.
    " <error handling>
  ENDIF.
