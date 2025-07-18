@ClientHandling.algorithm: #SESSION_VARIABLE
@AbapCatalog.sqlViewName: 'ZCPROCQRY'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@Analytics.query: true
@VDM.viewType: #CONSUMPTION
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Procurement DB Formula Query'
@Analytics.dataExtraction.delta.changeDataCapture.automatic: true
define view ZC_PROCUREMENT_QRY
  as select from ZI_PROCUREMENT_DB
{
  @AnalyticsDetails.query.axis: #ROWS
  ebeln,
  bukrs,
  bedat,
  ekorg,
  waers,
  ekgrp,
  lifnr,
  wkurs,
  ebelp,
  werks,
  matnr,
  matkl,
  netpr,
  @DefaultAggregation: #SUM
  Purchase_Quantity,
  //  loekz,
  //  meins,
  Purchasing_Volume,
  v_netpr,
  preis,
  name1,
  Buyer,
  NETPR_INR,
  PREIS_INR,
  v_bedat,
  ekotx,
  Purchasing_Category,
  vendor,
  FiscalPeriod,
  FiscalYear,
  mtart,
  ExchangeRate,
  SourceCurrency,
  TargetCurrency,
  NETPR_USDN,
  PREIS_USDN,
  DeliveryDate,
  vgabe,
  belnr,
  GRN_Date,
  CalendarYear,
  CalendarMonth,
  eknam,
//  VendorCode,
//  VendorDesc,
  AgeingDays,
  Ageing,
  banfn,
  PR_Count,
  creationdate,
  PRPO1_CALEN_YEAR,
  PRPO1_CALEN_MONTH,
  PRPO1_ageingdays,
  PRPO1_Ageing,
  mblnr,
  mjahr,
  vgart,
  budat,
  lineid,
  lineid1,
  bwart,
  dmbtr,
  menge,
  returnmeins,
  Actual_dmbtr,
  maktx,
  wgbez,
  butxt,
  TotalReceiptQuantity,
  TotalRejectionValue,
  TotalRejectionQuantity,
  TotalReceiptValue,
  Quantity_Rejection_Percentage,
  Value_Rejection_Percentage,
  CalYear,
  CompanyCode,
  Country,
  Country_Name,
  Region,
  Region_Name
  //  @EndUserText.label: 'Purchase Order'
  //  Purchase_Order,
  //  @Semantics.amount.currencyCode: 'RHCUR'
  //  @DefaultAggregation: #SUM
  //  @EndUserText.label: 'Total Invoice'
  //  Invoice,
  //  rhcur,
  //  @EndUserText.label: 'Net Value'
  //  @DefaultAggregation: #SUM
  //  Net_Value,
  //  @EndUserText.label: 'Gross Value'
  //  @DefaultAggregation: #SUM
  //  Gross_Value,
  //  @EndUserText.label: 'Quantity'
  //  @DefaultAggregation: #SUM
  //  Quantity,
  //  @DefaultAggregation: #SUM
  //  Ageing_analysis,
  //  CalYear,
  //  CompanyCode,
  //  Country,
  //  Country_Name,
  //  Region,
  //  Region_Name
}
