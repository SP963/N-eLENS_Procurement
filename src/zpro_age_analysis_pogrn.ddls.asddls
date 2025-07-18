@AbapCatalog.sqlViewName: 'ZPROAA1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'POGRN Details'
define view ZPRO_AGE_ANALYSIS_POGRN as select from eket as a
inner join ekbe as b on a.ebeln = b.ebeln and a.ebelp = b.ebelp
inner join ekko as c on a.ebeln = c.ebeln
inner join t001w as d on b.werks = d.werks and d.spras = $session.system_language
inner join t024 as e on c.ekgrp = e.ekgrp
inner join t024e as f on c.ekorg = f.ekorg
left outer join lfa1 as g on c.lifnr = g.lifnr and g.spras = $session.system_language
//left outer join I_CalendarDate as i on b.budat = i.CalendarDate
{
  a.ebeln as ebeln,
  a.ebelp as ebelp, 
  a.eindt as DeliveryDate,
  b.vgabe as vgabe,
  b.belnr as belnr,
  b.budat as GRN_Date,
  b.werks as werks,
//  i.CalendarYear as CalendarYear1,
//  i.CalendarMonth as CalendarMonth1,
  cast(substring(b.budat,1,4) as abap.numc(4)) as CalendarYear,
  cast(substring(b.budat,5,2) as abap.numc(2)) as CalendarMonth,
  c.lifnr as lifnr,
  c.ekorg as ekorg,
  c.ekgrp as ekgrp,
  d.name1 as name1,
  e.eknam as eknam,
  f.ekotx as ekotx,
  g.lifnr as VendorCode,
  g.name1 as VendorDesc,
  dats_days_between(a.eindt,b.budat) as AgeingDays
}
 
