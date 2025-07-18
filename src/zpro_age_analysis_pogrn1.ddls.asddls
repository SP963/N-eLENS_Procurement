@AbapCatalog.sqlViewName: 'ZPROAA_1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'POGRN Details'
define view ZPRO_AGE_ANALYSIS_POGRN1
  as select from ZPRO_AGE_ANALYSIS_POGRN as a

{
  a.ebeln                    as ebeln,
  a.ebelp                    as ebelp,
  a.DeliveryDate             as DeliveryDate,
  a.vgabe                    as vgabe, 
  a.belnr                    as belnr,
  a.GRN_Date                 as GRN_Date,
  a.werks                    as werks,
  a.CalendarYear,
  a.CalendarMonth,
  a.lifnr                    as lifnr,
  a.ekorg                    as ekorg,
  a.ekgrp                    as ekgrp,
  a.name1                    as name1,
  a.eknam                    as eknam,
  a.ekotx                    as ekotx,
  a.VendorCode               as VendorCode,
  a.VendorDesc               as VendorDesc,
  @Semantics.calendar.dayOfMonth: true
  @DefaultAggregation: #SUM
  abs(a.AgeingDays)          as AgeingDays,
  case
  when (a.AgeingDays > 0 and a.AgeingDays <= 15) then '1-15 Days'
  when (a.AgeingDays >= 16 and a.AgeingDays <= 30) then '16-30 Days'
  when a.AgeingDays >= 31 then 'Above 30 Days'
  else 'Within GRN Date' end as Ageing
}
