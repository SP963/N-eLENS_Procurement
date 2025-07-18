@AbapCatalog.sqlViewName: 'ZPRO4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'Purchase Details'
define view ZPRO_PUR_ACT_PRICE4 as select from ZPRO_PUR_ACT_PRICE3 as a
left outer join t247 as t on a.CalendarMonth = t.mnr and t.spras = $session.system_language  


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
  a.menge1 as menge1,
  a.tbtkz as tbtkz,
  a.netpr as netpr,
  a.Total_PurOrder_Qty as Total_PurOrder_Qty,
  a.ekorg as ekorg,
  a.ekgrp as ekgrp,
  a.bwart as bwart,
  a.Total_PurchaseOrder_Value,
  a.Inward_Quantity,       
  a.Outward_Quantity,
  a.matkl as matkl,
  a.maktx as maktx,
  a.PlantName as PlantName,
  a.butxt as butxt,
  a.eknam as eknam,
  a.ekotx as ekotx,
  a.wgbez as wgbez,
  a.name1 as name1,
  a.CalendarDate as CalendarDate,
  a.CalendarYear as CalendarYear,
  a.CalendarMonth as CalendarMonth,
  concat_with_space(a.CalendarMonth , t.ktx , 1) as CalenderMonthDisplay, 
  a.FiscalYear as FiscalYear,
  a.FiscalPeriod as FiscalPeriod,
  a.Total_Invoice_Quantity,
  a.InvoiceValue_S,
  a.InvoiceValue_H,
  a.Purchase_Quantity_S,
  a.Purchase_Quantity_H,
  (a.InvoiceValue_S - a.InvoiceValue_H ) as Total_Invoice_Value,
  (a.Inward_Quantity - a.Outward_Quantity ) as Invoice_Quantity,
  
  case
  when a.shkzg = 'S' then a.Total_PurchaseOrder_Value
  else 0.00 end as PurchaseValue_S, 

  case
  when a.shkzg = 'H' then a.Total_PurchaseOrder_Value
  else 0.00 end as PurchaseValue_H,
  
  case
  when a.tbtkz <> 'X' then (a.Purchase_Quantity_S - a.Purchase_Quantity_H) 
  else 0.00 end as Total_Purchase_Quantity
}
  
