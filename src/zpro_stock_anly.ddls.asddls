@AbapCatalog.sqlViewName: 'ZPROSTA'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'Stock Analysis by Product'

define view ZPRO_STOCK_ANLY as select from nsdm_v_mseg as a
inner join nsdm_v_mkpf as b on a.mblnr = b.mblnr and a.mjahr = b.mjahr
inner join I_FiscalCalendarDate as c on b.budat = c.CalendarDate and c.FiscalYearVariant = 'V3'
left outer join ZPRO_YEAR_CALCULATION as d on c.CalendarDate = d.CalendarDate
inner join mbew as e on a.matnr = e.matnr and a.bwtar = e.bwtar and a.mjahr = e.lfgja
left outer join mara as g on a.matnr = g.matnr
left outer join makt as h on a.matnr = h.matnr and h.spras  = $session.system_language
left outer join t023t as i on g.matkl = i.matkl and i.spras = $session.system_language
left outer join t001w as j on a.werks = j.werks and j.spras = $session.system_language
left outer join t001k as k on a.werks = k.bwkey
left outer join t001 as l on k.bukrs = l.bukrs and l.spras = $session.system_language
left outer join lfa1 as m on a.lifnr = m.lifnr 
left outer join lfm1 as n on a.lifnr = n.lifnr 
left outer join t024 as o on n.ekgrp = o.ekgrp
left outer join t024e as p on n.ekorg = p.ekorg
//inner join I_CalendarDate as j on j.CalendarDate = $session.system_date

{
 
 a.mblnr as mblnr,
 a.mjahr as mjahr,
 a.bwart as bwart,
 a.matnr as matnr,
 a.werks as werks,
 a.lifnr as lifnr,
 a.shkzg as shkzg,
 a.waers as waers,
 a.dmbtr as dmbtr,
 a.bwtar as bwtar,
 a.menge as menge,
 a.bukrs as bukrs,
 a.lbkum as lbkum,
 a.salk3 as salk3,
 b.budat as budat,
 c.FiscalYearVariant as FiscalYearVariant,
 c.CalendarDate as CalendarDate,
 c.FiscalPeriod as FiscalPeriod,
 c.FiscalYear as FiscalYear,
 d.FiscalMonth as FiscalMonth,
 d.FiscalMonthDesc as FiscalMonthDesc,
 e.lbkum as lbkum_1,
 e.salk3 as salk3_1,
 g.mtart as mtart,
 g.matkl as matkl,
 h.maktx as maktx,
 i.wgbez as wgbez,
 j.name1 as plantname,
 l.butxt as butxt,
 m.name1 as name1,
 n.ekgrp as ekgrp,
 n.ekorg as ekorg,
 o.eknam as eknam,
 p.ekotx as ekotx,  
 
 case a.shkzg
 when 'S' then a.menge else 0.00 end as TotalStockQuantity,

 case a.shkzg
 when 'S' then a.dmbtr else 0.00 end as TotalStockValue,
 
 case 
 when (a.bwart = '201' or a.bwart = '202' or a.bwart = '221' or a.bwart = '222' or a.bwart = '231' or a.bwart = '232' or
       a.bwart = '241' or a.bwart = '242' or a.bwart = '251' or a.bwart = '252' or a.bwart = '261' or a.bwart = '262' or 
       a.bwart = '281' or a.bwart = '282' or a.bwart = '291' or a.bwart = '292' or a.bwart = '331' or a.bwart = '332' or
       a.bwart = '334' or a.bwart = '335' or a.bwart = '336' or a.bwart = '337' or a.bwart = '551' or a.bwart = '552' or
       a.bwart = '553' or a.bwart = '554' or a.bwart = '555' or a.bwart = '556' or a.bwart = '557' or a.bwart = '558' )
       then a.menge else 0.00 end as TotalConsumptionQty,

 case 
 when (a.bwart = '201' or a.bwart = '202' or a.bwart = '221' or a.bwart = '222' or a.bwart = '231' or a.bwart = '232' or
       a.bwart = '241' or a.bwart = '242' or a.bwart = '251' or a.bwart = '252' or a.bwart = '261' or a.bwart = '262' or 
       a.bwart = '281' or a.bwart = '282' or a.bwart = '291' or a.bwart = '292' or a.bwart = '331' or a.bwart = '332' or
       a.bwart = '334' or a.bwart = '335' or a.bwart = '336' or a.bwart = '337' or a.bwart = '551' or a.bwart = '552' or
       a.bwart = '553' or a.bwart = '554' or a.bwart = '555' or a.bwart = '556' or a.bwart = '557' or a.bwart = '558' )
       then a.menge else 0.00 end as TotalConsumptionValue
    
} 
