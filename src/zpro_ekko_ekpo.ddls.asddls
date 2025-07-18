@AbapCatalog.sqlViewName: 'ZPROCJ1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'Purchase Details'
define view ZPRO_EKKO_EKPO
  as select from    ekko                 as a
    inner join      ekpo                 as b on a.ebeln = b.ebeln
    inner join      eipa                 as c on  b.ebeln = c.ebeln
                                              and b.ebelp = c.ebelp
    left outer join t001w                as d on  b.werks = d.werks
                                              and d.spras = $session.system_language
    left outer join t024                 as e on a.ekgrp = e.ekgrp
    left outer join t024e                as f on a.ekorg = f.ekorg
    left outer join t023t                as g on  b.matkl = g.matkl
                                              and g.spras = $session.system_language
    left outer join lfa1                 as h on a.lifnr = h.lifnr
    left outer join I_FiscalCalendarDate as i on a.bedat = i.CalendarDate
    left outer join ZPRO_MARA            as j on b.matnr = j.matnr
  //left outer join tcurr as k on a.bedat = k.gdatu
    left outer join I_ExchangeRate       as k on a.bedat = k.ExchangeRateEffectiveDate
{
  a.ebeln                                      as ebeln,
  a.bukrs                                      as bukrs,
  a.bedat                                      as bedat,
  a.ekorg                                      as ekorg,
  a.waers                                      as waers,
  a.ekgrp                                      as ekgrp,
  a.lifnr                                      as lifnr,
  a.wkurs                                      as wkurs,
  b.ebelp                                      as ebelp,
  b.werks                                      as werks,
  b.matnr                                      as matnr,
  b.matkl                                      as matkl,
  b.netpr                                      as netpr,
  b.meins                                      as meins,
  b.menge                                      as Purchase_Quantity,
  b.loekz                                      as loekz,
  (b.netpr * b.menge)                          as Purchasing_Volume,
  case a.waers
  when 'USDN' then div(b.netpr, 100)
  else cast( b.netpr as abap.dec( 24, 3 )) end as v_netpr,
  c.preis                                      as preis,
  d.name1                                      as name1,
  e.eknam                                      as Buyer,
  (b.netpr * a.wkurs)                          as NETPR_INR,
  (c.preis * a.wkurs)                          as PREIS_INR,
  a.bedat                                      as v_bedat,
  f.ekotx                                      as ekotx,
  g.wgbez                                      as Purchasing_Category,
  h.name1                                      as vendor,
  i.FiscalPeriod                               as FiscalPeriod,
  i.FiscalYear                                 as FiscalYear,
  j.mtart                                      as mtart,
  @DefaultAggregation: #SUM
  cast(k.ExchangeRate as abap.dec( 24, 3 ))    as ExchangeRate,
  k.SourceCurrency                             as SourceCurrency,
  k.TargetCurrency                             as TargetCurrency
}
where
  b.loekz = ''
