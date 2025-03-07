@AbapCatalog.sqlViewName: 'ZINNER_JOIN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Inner Join in CDS view'
define view zcds_inner_join
  as select from zmanagers
    inner join   zemployee on zmanagers.employee_id = zemployee.employee_id
{
  key zmanagers.employee_id,
      zemployee.employee_fname,
      zemployee.employee_lname,
      zemployee.employee_mail,
      zemployee.zemployee_address,
      zmanagers.unit
}
