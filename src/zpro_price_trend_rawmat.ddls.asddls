@AbapCatalog.sqlViewName: 'ZPROCRM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'Price Trend of Raw Material'

define view ZPRO_PRICE_TREND_RAWMAT
  as select from ZPRO_EKKO_EKPO as a

{

  a.ebeln                                            as ebeln,
  a.bukrs                                            as bukrs,
  a.bedat                                            as bedat,
  a.ekorg                                            as ekorg,
  a.waers                                            as waers,
  a.ekgrp                                            as ekgrp,
  a.lifnr                                            as lifnr,
  @DefaultAggregation: #SUM
  a.wkurs                                            as wkurs,
  a.ebelp                                            as ebelp,
  a.werks                                            as werks,
  a.matnr                                            as matnr,
  a.matkl                                            as matkl,
  @DefaultAggregation: #SUM
  round(a.netpr,0)                                   as netpr,
  @DefaultAggregation: #SUM
  a.Purchase_Quantity                                as Purchase_Quantity,
  a.loekz                                            as loekz,
//  @DefaultAggregation: #SUM
  a.meins                                            as meins,
  @DefaultAggregation: #SUM
  round(a.Purchasing_Volume,0)                       as Purchasing_Volume,
  @Semantics.amount.currencyCode: 'SourceCurrency'
  @DefaultAggregation: #SUM
  round(cast( a.v_netpr as bprei ),0)                as v_netpr,
  @DefaultAggregation: #SUM
  round(a.preis,0)                                   as preis,
  a.name1                                            as name1,
  a.Buyer                                            as Buyer,
  @Semantics.amount.currencyCode: 'SourceCurrency'
  @DefaultAggregation: #SUM
  round(a.NETPR_INR,0)                               as NETPR_INR,
  @Semantics.amount.currencyCode: 'SourceCurrency'
  @DefaultAggregation: #SUM
  round(a.PREIS_INR,0)                               as PREIS_INR,
  a.bedat                                            as v_bedat,
  a.ekotx                                            as ekotx,
  a.Purchasing_Category                              as Purchasing_Category,
  a.vendor                                           as vendor,
  a.FiscalPeriod                                     as FiscalPeriod,
  a.FiscalYear                                       as FiscalYear,
  a.mtart                                            as mtart,
  @DefaultAggregation: #SUM
  round(cast(a.ExchangeRate as abap.dec( 24, 3 )),0) as ExchangeRate,
  a.SourceCurrency                                   as SourceCurrency,
  a.TargetCurrency                                   as TargetCurrency,
  @Semantics.amount.currencyCode: 'SourceCurrency'
  @DefaultAggregation: #SUM
  round(div(a.NETPR_INR, a.ExchangeRate),0)          as NETPR_USDN,
  @Semantics.amount.currencyCode: 'SourceCurrency'
  @DefaultAggregation: #SUM
  round(div(a.PREIS_INR, a.ExchangeRate),0)          as PREIS_USDN

} // where a.mandt = $session.client
