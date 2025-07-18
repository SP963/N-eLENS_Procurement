@AbapCatalog.sqlViewName: 'ZPRORTA1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'Return TurnOver Analysis'

define view ZPRO_RETURN_TURN_ANLY1
  as select from ZPRO_RETURN_TURN_ANLY as a

{

  a.mblnr        as mblnr,
  a.mjahr        as mjahr,
  a.vgart        as vgart,
  a.budat        as budat,
  a.lineid       as lineid,
  a.lineid1      as lineid1,
  a.bwart        as bwart,
  a.matnr        as matnr,
  a.werks        as werks,
  a.lifnr        as lifnr,
  a.waers        as waers,
  a.dmbtr        as dmbtr,
  @DefaultAggregation: #SUM
  @Semantics.quantity.unitOfMeasure: 'MEINS'
  a.menge        as menge,
  @Semantics.unitOfMeasure: true
  a.meins        as meins,
  a.ebeln        as ebeln,
  a.bukrs        as bukrs,
  a.Actual_dmbtr as Actual_dmbtr,
  a.name1        as name1,
  a.ekorg        as ekorg,
  a.ekgrp        as ekgrp,
  a.eknam        as eknam,
  a.ekotx        as ekotx,
  a.matkl        as matkl,
  a.maktx        as maktx,
  a.wgbez        as wgbez,
  a.butxt        as butxt,
  a.TotalReceiptQuantity,
  //cast(a.TotalReceiptQuantity as abap.fltp(16)) as TotalReceiptQuantity,
  a.TotalRejectionValue,
  //cast(a.TotalRejectionQuantity as abap.fltp(16)) as TotalRejectionQuantity,
  a.TotalRejectionQuantity,

  case
  when (a.bwart = '101' or a.bwart = '102') then a.Actual_dmbtr
  else 0.00 end  as TotalReceiptValue

  //(div(a.TotalRejectionQuantity , a.TotalReceiptQuantity) * 100) as Quantity_Rejection

  //div(a.TotalRejectionValue , TotalReceiptValue ) * 100 end as Value_Rejection_Percentage



}
