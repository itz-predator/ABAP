@AbapCatalog.sqlViewName: 'ZCROSSJOIN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Cross Join in CDS view'
define view ZCDS_CROSS_JOIN as select from zemployee
cross join zmanagers
     {
      key zemployee.employee_id,
      zemployee.employee_fname,
      zemployee.employee_lname,
      zemployee.employee_mail,
      zemployee.zemployee_address,
      zmanagers.unit
}
