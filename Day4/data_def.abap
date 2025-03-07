@AbapCatalog.sqlViewName: 'ZCDS_ACT_VEN' //SE11 SQL view name
@AbapCatalog.Complier.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS View data definition'

define view ZCDS_ACT_VENDOR //CDS view name
  as select from  lfa1 as a
  inner join   lfb1 as b on a.lifnr = b.lifnr and b.sperr = ''
  inner join   lfm1 as c on a.lifnr = c.lifnr and c.sperm = ''
  left outer join adrc as d on a.adrnr = d.addrnumber
{
  key a.lifnr,
  key b.bukrs,
  key c.ekorg,
  d.name1,
  d.city1,
  d.region,
  d.country,
  d.post_code1
} where a.loevm = '' and a.sperr = '' and a.sperm = ''
