@AbapCatalog.sqlViewName: 'ZPRORTA'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'Return TurnOver Analysis'
define view ZPRO_RETURN_TURN_ANLY
  as select from    nsdm_v_mkpf as a
    inner join      nsdm_v_mseg as b on  a.mblnr = b.mblnr
                                     and a.mjahr = b.mjahr
    left outer join lfa1        as c on b.lifnr = c.lifnr
    left outer join ekko        as d on b.ebeln = d.ebeln
    left outer join t024        as e on d.ekgrp = e.ekgrp
    left outer join t024e       as f on d.ekorg = f.ekorg
    left outer join mara        as g on b.matnr = g.matnr
    left outer join makt        as h on  b.matnr = h.matnr
                                     and h.spras = $session.system_language
    left outer join t023t       as i on  g.matkl = i.matkl
                                     and i.spras = $session.system_language
    left outer join t001w       as j on  b.werks = j.werks
                                     and j.spras = $session.system_language
    left outer join t001k       as k on b.werks = k.bwkey
    left outer join t001        as l on  k.bukrs = l.bukrs
                                     and l.spras = $session.system_language

  /*
  inner join I_CalendarDate as j on j.CalendarDate = $session.system_date
  */
{

  a.mblnr                          as mblnr,
  a.mjahr                          as mjahr,
  a.vgart                          as vgart,
  a.budat                          as budat,
  b.line_id                        as lineid,
  b.line_id                        as lineid1,
  b.bwart                          as bwart,
  b.matnr                          as matnr,
  b.werks                          as werks,
  b.lifnr                          as lifnr,
  b.waers                          as waers,
  b.dmbtr                          as dmbtr,
  @DefaultAggregation: #SUM
  @Semantics.quantity.unitOfMeasure: 'MEINS'
  b.menge                          as menge,
  @Semantics.unitOfMeasure: true
  b.meins                          as meins,
  b.ebeln                          as ebeln,
  b.bukrs                          as bukrs,
  div(b.dmbtr, 10)                 as Actual_dmbtr,
  c.name1                          as name1,
  d.ekorg                          as ekorg,
  d.ekgrp                          as ekgrp,
  e.eknam                          as eknam,
  f.ekotx                          as ekotx,
  g.matkl                          as matkl,
  h.maktx                          as maktx,
  i.wgbez                          as wgbez,
  l.butxt                          as butxt,

  case
  when (b.bwart = '101' or b.bwart = '102') then b.menge
  else 0.00 end                    as TotalReceiptQuantity,

  case
  when (b.bwart = '122' or b.bwart = '123' or b.bwart = '161' or b.bwart = '162' or
        b.bwart = '171' or b.bwart = '172' or b.bwart = '173' or b.bwart = '174' or
        b.bwart = '175' or b.bwart = '176' or b.bwart = '177' or b.bwart = '178')

        then b.dmbtr else 0.00 end as TotalRejectionValue,

  case
  when (b.bwart = '122' or b.bwart = '123' or b.bwart = '161' or b.bwart = '162' or
       b.bwart = '171' or b.bwart = '172' or b.bwart = '173' or b.bwart = '174' or
       b.bwart = '175' or b.bwart = '176' or b.bwart = '177' or b.bwart = '178')

       then b.menge else 0.00 end  as TotalRejectionQuantity


}
where
       a.vgart =  'WE'
  and(
       b.bwart =  '101'
    or b.bwart =  '102'
    or b.bwart =  '122'
    or b.bwart =  '123'
    or b.bwart =  '161'
    or b.bwart =  '162'
    or b.bwart =  '171'
    or b.bwart =  '172'
    or b.bwart =  '173'
    or b.bwart =  '174'
    or b.bwart =  '175'
    or b.bwart =  '176'
    or b.bwart =  '177'
    or b.bwart =  '178'
  )
  and  b.ebeln <> ''
