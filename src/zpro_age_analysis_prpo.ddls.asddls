@AbapCatalog.sqlViewName: 'ZPROPO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'PR PO Details'
define view ZPRO_AGE_ANALYSIS_PRPO as select from ekko as a
inner join ekpo as b on a.ebeln = b.ebeln
inner join t001w as d on b.werks = d.werks and d.spras = $session.system_language
inner join t024 as e on a.ekgrp = e.ekgrp
inner join t024e as f on a.ekorg = f.ekorg
inner join lfa1 as h on a.lifnr = h.lifnr and h.spras = $session.system_language
{
  a.ebeln as ebeln,
  a.aedat as aedat,
  a.ekorg as ekorg,
  a.ekgrp as ekgrp,
  a.lifnr as lifnr,
  b.banfn as banfn,
  b.werks as werks,
  b.creationdate as creationdate,
  cast(substring(b.creationdate,1,4) as abap.numc(4)) as CalendarYear,
  cast(substring(b.creationdate,5,2) as abap.numc(2)) as CalendarMonth,
  d.name1 as name1,
  e.eknam as eknam,
  f.ekotx as ekotx, 
  h.name1 as VendorDesc,
  dats_days_between(b.creationdate, a.aedat) as Ageingdays    
  }

