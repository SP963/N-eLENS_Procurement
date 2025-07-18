@AbapCatalog.sqlViewName: 'ZPRORTA3'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'Return TurnOver Analysis'

define view ZPRO_RETURN_TURN_ANLY3
  as select from ZPRO_RETURN_TURN_ANLY2 as a

{

  a.mblnr                             as mblnr,
  a.mjahr                             as mjahr,
  a.vgart                             as vgart,
  a.budat                             as budat,
  a.lineid                            as lineid,
  a.lineid1                           as lineid1,
  a.bwart                             as bwart,
  a.matnr                             as matnr,
  a.werks                             as werks,
  a.lifnr                             as lifnr,
  a.waers                             as waers,
  @DefaultAggregation: #SUM
  round(a.dmbtr, 0)                   as dmbtr,
  //    @Semantics.quantity.unitOfMeasure: 'MEINS'
  @DefaultAggregation: #SUM
  cast(a.menge as abap.dec( 13, 3 ) ) as menge,
  @Semantics.unitOfMeasure: true
  a.meins                             as meins,
  a.ebeln                             as ebeln,
  a.bukrs                             as bukrs,
  @DefaultAggregation: #SUM
  round(a.Actual_dmbtr,0)             as Actual_dmbtr,
  a.name1                             as name1,
  a.ekorg                             as ekorg,
  a.ekgrp                             as ekgrp,
  a.eknam                             as eknam,
  a.ekotx                             as ekotx,
  a.matkl                             as matkl,
  a.maktx                             as maktx,
  a.wgbez                             as wgbez,
  a.butxt                             as butxt,
  @DefaultAggregation: #SUM
  a.TotalReceiptQuantity,
  @DefaultAggregation: #SUM
  a.TotalRejectionValue,
  @DefaultAggregation: #SUM
  a.TotalRejectionQuantity,
  @DefaultAggregation: #SUM
  a.TotalReceiptValue,
  @DefaultAggregation: #SUM
  (a.Quantity_Rejection * 100.00)     as Quantity_Rejection_Percentage,
  @DefaultAggregation: #SUM
  (a.Value_Rejection * 100.00)        as Value_Rejection_Percentage


}
