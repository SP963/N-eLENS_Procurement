@AbapCatalog.sqlViewName: 'ZIPROCDB'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'Procurement DB Formula'
define view ZI_PROCUREMENT_DB
  as select distinct from ZPRO_AGE_ANALYSIS_POGRN1 as _POGRN
    inner join            ZPRO_AGE_ANALYSIS_PRPO1  as _PRPO1  on _PRPO1.lifnr = _POGRN.lifnr
    inner join            ZPRO_PRICE_TREND_RAWMAT  as _RAWMAT on _POGRN.ebeln = _RAWMAT.ebeln

    left outer join       ZPRO_PUR_ACT_PRICE5      as _PRICE  on  _PRICE.lifnr = _POGRN.lifnr
                                                              and _PRICE.ebeln = _POGRN.ebeln
    inner join            ZPRO_RETURN_TURN_ANLY3   as _RETURN on _RETURN.ebeln = _POGRN.ebeln
    left outer join       ZPRO_STOCK_ANLY          as _STOCK  on _STOCK.bukrs = _RAWMAT.bukrs
    left outer join       ZI_PROC_VENDOR           as _Vendor on _Vendor.Vendor = _POGRN.lifnr


{
  _RAWMAT.ebeln                                            as ebeln,
  _RAWMAT.bukrs                                            as bukrs,
  _RAWMAT.bedat                                            as bedat,
  _RAWMAT.ekorg                                            as ekorg,
  _RAWMAT.waers                                            as waers,
  _RAWMAT.ekgrp                                            as ekgrp,
  _RAWMAT.lifnr                                            as lifnr,
  @DefaultAggregation: #SUM
  _RAWMAT.wkurs                                            as wkurs,
  _RAWMAT.ebelp                                            as ebelp,
  _RAWMAT.werks                                            as werks,
  _RAWMAT.matnr                                            as matnr,
  _RAWMAT.matkl                                            as matkl,
  @DefaultAggregation: #SUM
  round(_RAWMAT.netpr,0)                                   as netpr,
  @DefaultAggregation: #SUM
  @Semantics.quantity.unitOfMeasure: 'MEINS'
  _RAWMAT.Purchase_Quantity                                as Purchase_Quantity,
  _RAWMAT.loekz                                            as loekz,
  @DefaultAggregation: #SUM
  _RAWMAT.meins                                            as meins,
  @DefaultAggregation: #SUM
  round(_RAWMAT.Purchasing_Volume,0)                       as Purchasing_Volume,
  @Semantics.amount.currencyCode: 'SourceCurrency'
  @DefaultAggregation: #SUM
  round(cast( _RAWMAT.v_netpr as bprei ),0)                as v_netpr,
  @DefaultAggregation: #SUM
  round(_RAWMAT.preis,0)                                   as preis,
  _RAWMAT.name1                                            as name1,
  _RAWMAT.Buyer                                            as Buyer,
  @Semantics.amount.currencyCode: 'SourceCurrency'
  @DefaultAggregation: #SUM
  round(_RAWMAT.NETPR_INR,0)                               as NETPR_INR,
  @Semantics.amount.currencyCode: 'SourceCurrency'
  @DefaultAggregation: #SUM
  round(_RAWMAT.PREIS_INR,0)                               as PREIS_INR,
  _RAWMAT.bedat                                            as v_bedat,
  _RAWMAT.ekotx                                            as ekotx,
  _RAWMAT.Purchasing_Category                              as Purchasing_Category,
  _RAWMAT.vendor                                           as vendor,
  _RAWMAT.FiscalPeriod                                     as FiscalPeriod,
  _RAWMAT.FiscalYear                                       as FiscalYear,
  _RAWMAT.mtart                                            as mtart,
  @DefaultAggregation: #SUM
  round(cast(_RAWMAT.ExchangeRate as abap.dec( 24, 3 )),0) as ExchangeRate,
  _RAWMAT.SourceCurrency                                   as SourceCurrency,
  _RAWMAT.TargetCurrency                                   as TargetCurrency,
  @Semantics.amount.currencyCode: 'SourceCurrency'
  @DefaultAggregation: #SUM
  round(div(_RAWMAT.NETPR_INR, _RAWMAT.ExchangeRate),0)    as NETPR_USDN,
  @Semantics.amount.currencyCode: 'SourceCurrency'
  @DefaultAggregation: #SUM
  round(div(_RAWMAT.PREIS_INR, _RAWMAT.ExchangeRate),0)    as PREIS_USDN,
  _POGRN.DeliveryDate                                      as DeliveryDate,
  _POGRN.vgabe                                             as vgabe,
  _POGRN.belnr                                             as belnr,
  _POGRN.GRN_Date                                          as GRN_Date,
  _POGRN.CalendarYear,
  _POGRN.CalendarMonth,
  _POGRN.eknam                                             as eknam,
  _POGRN.VendorCode                                        as VendorCode,
  _POGRN.VendorDesc                                        as VendorDesc,
  @Semantics.calendar.dayOfMonth: true
  @DefaultAggregation: #SUM
  abs(_POGRN.AgeingDays)                                   as AgeingDays,
  case
  when (_POGRN.AgeingDays > 0 and _POGRN.AgeingDays <= 15) then '1-15 Days'
  when (_POGRN.AgeingDays >= 16 and _POGRN.AgeingDays <= 30) then '16-30 Days'
  when _POGRN.AgeingDays >= 31 then 'Above 30 Days'
  else 'Within GRN Date' end                               as Ageing,
  _PRPO1.banfn                                             as banfn,
  @DefaultAggregation: #SUM
  _PRPO1.count2                                            as PR_Count,
  _PRPO1.creationdate                                      as creationdate,
  _PRPO1.CalendarYear                                      as PRPO1_CALEN_YEAR,
  _PRPO1.CalendarMonth                                     as PRPO1_CALEN_MONTH,
  _PRPO1.Ageingdays                                        as PRPO1_ageingdays,
  case
  when (_PRPO1.Ageingdays > 0 and _PRPO1.Ageingdays <= 15) then '1-15 Days'
  when (_PRPO1.Ageingdays >= 16 and _PRPO1.Ageingdays <= 30) then '16-30'
  when _PRPO1.Ageingdays >= 31 then 'Above 30 Days'
  else 'Within PO Date' end                                as PRPO1_Ageing,
  _RETURN.mblnr                                            as mblnr,
  _RETURN.mjahr                                            as mjahr,
  _RETURN.vgart                                            as vgart,
  _RETURN.budat                                            as budat,
  _RETURN.lineid                                           as lineid,
  _RETURN.lineid1                                          as lineid1,
  _RETURN.bwart                                            as bwart,
  @DefaultAggregation: #SUM
  round(_RETURN.dmbtr, 0)                                  as dmbtr,
  @DefaultAggregation: #SUM
  cast(_RETURN.menge as abap.dec( 13, 3 ) )                as menge,
  @Semantics.unitOfMeasure: true
  _RETURN.meins                                            as returnmeins,
  @DefaultAggregation: #SUM
  round(_RETURN.Actual_dmbtr,0)                            as Actual_dmbtr,
  _RETURN.maktx                                            as maktx,
  _RETURN.wgbez                                            as wgbez,
  _RETURN.butxt                                            as butxt,
  @DefaultAggregation: #SUM
  _RETURN.TotalReceiptQuantity,
  @DefaultAggregation: #SUM
  _RETURN.TotalRejectionValue,
  @DefaultAggregation: #SUM
  _RETURN.TotalRejectionQuantity,
  @DefaultAggregation: #SUM
  _RETURN.TotalReceiptValue,
  @DefaultAggregation: #SUM
  _RETURN.Quantity_Rejection_Percentage,
  @DefaultAggregation: #SUM
  _RETURN.Value_Rejection_Percentage,
  _Vendor.CalYear,
  _Vendor.CompanyCode,
  _Vendor.Country,
  _Vendor.Country_Name,
  _Vendor.Region,
  _Vendor.Region_Name
  //  @EndUserText.label: 'Purchase Order'
  //  _proc.Purchase_Order,
  //  @Semantics.amount.currencyCode: 'RHCUR'
  //  @DefaultAggregation: #SUM
  //  @EndUserText.label: 'Total Invoice'
  //  _proc.Invoice,
  //  _proc.rhcur,
  //  @EndUserText.label: 'Net Value'
  //  @DefaultAggregation: #SUM
  //  _proc.Net_Value,
  //  @EndUserText.label: 'Gross Value'
  //  @DefaultAggregation: #SUM
  //  _proc.Gross_Value,
  //  @EndUserText.label: 'Quantity'
  //  @DefaultAggregation: #SUM
  //  _proc.Quantity,
  //
  //  @DefaultAggregation: #SUM
  //  _proc.Ageing_analysis,
  //  _proc.CalYear,
  //  _proc.CompanyCode,
  //  _proc.Country,
  //  _proc.Country_Name,
  //  _proc.Region,
  //  _proc.Region_Name
}
