@AbapCatalog.sqlViewName: 'ZRIGHTJOIN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Right Outer Join'
define view ZCDS_right_outerjoin as select from zemployee
right outer join zmanagers
    on zemployee.employee_id = zmanagers.employee_id {
      key zemployee.employee_id,
      zemployee.employee_fname,
      zemployee.employee_lname,
      zemployee.employee_mail,
      zemployee.zemployee_address,
      zmanagers.unit
} 
