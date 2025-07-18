@AbapCatalog.sqlViewName: 'ZPRORTA2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'Return TurnOver Analysis'

define view ZPRO_RETURN_TURN_ANLY2
  as select from ZPRO_RETURN_TURN_ANLY1 as a

{

  a.mblnr                                  as mblnr,
  a.mjahr                                  as mjahr,
  a.vgart                                  as vgart,
  a.budat                                  as budat,
  a.lineid                                 as lineid,
  a.lineid1                                as lineid1,
  a.bwart                                  as bwart,
  a.matnr                                  as matnr,
  a.werks                                  as werks,
  a.lifnr                                  as lifnr,
  a.waers                                  as waers,
  a.dmbtr                                  as dmbtr,
  @DefaultAggregation: #SUM
  @Semantics.quantity.unitOfMeasure: 'MEINS'
  a.menge                                  as menge,
  @Semantics.unitOfMeasure: true
  a.meins                                  as meins,
  a.ebeln                                  as ebeln,
  a.bukrs                                  as bukrs,
  a.Actual_dmbtr                           as Actual_dmbtr,
  a.name1                                  as name1,
  a.ekorg                                  as ekorg,
  a.ekgrp                                  as ekgrp,
  a.eknam                                  as eknam,
  a.ekotx                                  as ekotx,
  a.matkl                                  as matkl,
  a.maktx                                  as maktx,
  a.wgbez                                  as wgbez,
  a.butxt                                  as butxt,
  a.TotalReceiptQuantity,
  cast(a.TotalRejectionValue as abap.fltp) as TotalRejectionValue,
  a.TotalRejectionQuantity,
  cast(a.TotalReceiptValue as abap.fltp)   as TotalReceiptValue,

  //(div(a.TotalRejectionQuantity , a.TotalReceiptQuantity) * 100) as Quantity_Rejection_Percentage,
  case
  when a.TotalReceiptQuantity > 0.00 then
  (a.TotalRejectionQuantity / a.TotalReceiptQuantity)
  else 0.00 end                            as Quantity_Rejection,
  case
  when a.TotalReceiptValue > 0.00 then
  (a.TotalRejectionValue / a.TotalReceiptValue )
  else 0.00 end                            as Value_Rejection



}
