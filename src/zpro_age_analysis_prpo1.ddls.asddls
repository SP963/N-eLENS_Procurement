@AbapCatalog.sqlViewName: 'ZPROPO1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'PR PO Details'
define view ZPRO_AGE_ANALYSIS_PRPO1 as select from ZPRO_AGE_ANALYSIS_PRPO as a
left outer join ZPRO_AGE_ANALYSIS_PRPO_COUNT1 as b on a.banfn = b.banfn

{
  a.ebeln as ebeln,
  a.aedat as aedat,
  a.ekorg as ekorg,
  a.ekgrp as ekgrp,
  a.lifnr as lifnr,  
  a.banfn as banfn,
  b.count2 as count2,
  a.werks as werks,
  a.creationdate as creationdate,
  a.CalendarYear,
  a.CalendarMonth,
  a.name1 as name1,
  a.eknam as eknam,
  a.ekotx as ekotx, 
  a.name1 as VendorDesc,
  a.Ageingdays,
  case 
  when (a.Ageingdays > 0 and a.Ageingdays <= 15) then '1-15 Days'
  when (a.Ageingdays >= 16 and a.Ageingdays <= 30) then '16-30'
  when a.Ageingdays >= 31 then 'Above 30 Days'
  else 'Within PO Date' end as Ageing
}

