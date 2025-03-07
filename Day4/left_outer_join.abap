@AbapCatalog.sqlViewName: 'ZLEFTJOIN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS view with Left outer Join'
define view zcds_left_outerjoin as select from zemployee
left outer join zmanagers
    on zemployee.employee_id = zmanagers.employee_id {
      key zemployee.employee_id,
      zemployee.employee_fname,
      zemployee.employee_lname,
      zemployee.employee_mail,
      zemployee.zemployee_address,
      zmanagers.unit
}
