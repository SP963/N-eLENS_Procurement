@AbapCatalog.sqlViewName: 'ZPRO3'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'Purchase Details'
define view ZPRO_PUR_ACT_PRICE3 as select from ZPRO_PUR_ACT_PRICE1 as a
inner join ZPRO_PUR_ACT_PRICE2 as b on a.ebeln = b.ebeln and a.ebelp = b.ebelp
left outer join mara as c on a.matnr = c.matnr 
left outer join makt as d on a.matnr = d.matnr and d.spras = $session.system_language
left outer join I_Plant as e on a.werks = e.Plant and e.Language = $session.system_language 
left outer join t001k as t on e.ValuationArea = t.bwkey
inner join t001 as t1 on t.bukrs = t1.bukrs and t1.spras = $session.system_language
left outer join t024 as f on b.ekgrp = f.ekgrp
left outer join t024e as g on b.ekorg = g.ekorg
left outer join t023t as h on c.matkl = h.matkl and h.spras = $session.system_language
left outer join lfa1 as i on a.lifnr = i.lifnr 
left outer join I_FiscalCalendarDate as j on a.budat = j.CalendarDate

//left outer join tcurr as k on a.bedat = k.gdatu
//left outer join I_ExchangeRate as k on a.bedat = k.ExchangeRateEffectiveDate

{
  a.belnr as belnr,
  a.gjahr as gjahr,
  a.blart as blart,
  a.budat as budat,
  a.bukrs as bukrs,
  a.lifnr as lifnr,
  a.waers as waers,
  a.rmwwr as rmwwr,
  a.ebeln as ebeln,
  a.ebelp as ebelp,
  a.matnr as matnr,
  a.bwtar as bwtar,
  a.werks as werks,
  a.wrbtr as wrbtr,
  a.shkzg as shkzg,
  a.menge as menge1,
  a.tbtkz as tbtkz,
  b.netpr as netpr,
  b.menge as Total_PurOrder_Qty,
  b.ekorg as ekorg,
  b.ekgrp as ekgrp,
  b.bwart as bwart,
  ( b.menge * div(b.netpr, 10)) as Total_PurchaseOrder_Value,
  case 
  when  (b.bwart = '101' or b.bwart = '103' or b.bwart = '105' or b.bwart = '107' or 
         b.bwart = '109' or b.bwart = '123' or b.bwart = '125' or b.bwart = '162')
         then a.menge
  else 0.00 end as Inward_Quantity,       

  case 
  when  (b.bwart = '102' or b.bwart = '104' or b.bwart = '106' or b.bwart = '108' or 
         b.bwart = '110' or b.bwart = '122' or b.bwart = '124' or b.bwart = '161')
         then a.menge
  else 0.00 end as Outward_Quantity,
  c.matkl as matkl,
  d.maktx as maktx,
  e.PlantName as PlantName,
  t1.butxt as butxt,
  f.eknam as eknam,
  g.ekotx as ekotx,
  h.wgbez as wgbez,
  i.name1 as name1,
  j.CalendarDate as CalendarDate,
  j._CalendarDate.CalendarYear as CalendarYear,
  j._CalendarDate.CalendarMonth as CalendarMonth,
  j.FiscalYear as FiscalYear,
  j.FiscalPeriod as FiscalPeriod,
  case
  when a.tbtkz <> 'X' then (a.Invoice_Quantity_S - a.Invoice_Quantity_H)
  else 0.00 end as Total_Invoice_Quantity,
  case
  when a.shkzg = 'S' then div(a.wrbtr, 10) 
  else 0.00 end as InvoiceValue_S,
  case
  when a.shkzg = 'H' then div(a.wrbtr, 10) 
  else 0.00 end as InvoiceValue_H,
  
  case
  when a.shkzg = 'S' then b.menge
  else 0.00 end as Purchase_Quantity_S,
  
  case
  when a.shkzg = 'H' then b.menge
  else 0.00 end as Purchase_Quantity_H

/*(a.InvoiceValue_S - a.InvoiceValue_H ) as Total_Invoice_Value
  case
  when a.shkzg = 'S' then b.Total_PurchaseOrder_Value
  else 0.00 end as PurchaseValue_S 

  case
  when a.shkzg = 'H' then b.Total_PurchaseOrder_Value
  else 0.00 end as PurchaseValue_H
  
  case
  when a.tbtkz <> 'X' then (a.PurchaseValue_S - a.PurchaseValue_H) 
  else 0.00 end as Total_Purchase_Value

  (a.Inward_Quantity - a.Outward_Quantity ) as Invoice_Quantity
  
  case
  when a.shkzg = 'S' then a.Invoice_Quantity
  else 0.00 end as Invoice_Quantity_S
  
  case
  when a.shkzg = 'H' then a.Invoice_Quantity
  else 0.00 end as Invoice_Quantity_H
  
  case
  when a.tbtkz <> 'X' then (a.Purchase_Quantity_S - a.Purchase_Quantity_H) 
  else 0.00 end as Total_Purchase_Quantity
*/
}
  
