@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Optimized CDS View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZRS_PO_TRACKING as select from ekko

    inner join ekpo on ekko.ebeln = ekpo.ebeln

{
ekko.ebeln,
ekko.bukrs,
ekko.ekorg,
ekko.aedat,
ekpo.ebelp,
ekpo.matnr,

ekpo.meins
}
