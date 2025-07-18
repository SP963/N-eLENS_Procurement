@AbapCatalog.sqlViewName: 'ZPRO5'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'Purchase Details'
define view ZPRO_PUR_ACT_PRICE5 as select from ZPRO_PUR_ACT_PRICE4 as a

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
  a.CalenderMonthDisplay as CalenderMonthDisplay, 
  a.FiscalYear as FiscalYear,
  a.FiscalPeriod as FiscalPeriod,
  a.Total_Invoice_Quantity,
  a.InvoiceValue_S,
  a.InvoiceValue_H,
  a.Purchase_Quantity_S,
  a.Purchase_Quantity_H,
  a.Total_Invoice_Value,
  a.Invoice_Quantity,
  a.PurchaseValue_S, 
  a.PurchaseValue_H,
  a.Total_Purchase_Quantity,

  case
  when a.tbtkz <> 'X' then (a.PurchaseValue_S - a.PurchaseValue_H) 
  else 0.00 end as Total_Purchase_Value,
  
  case
  when a.shkzg = 'S' then a.Invoice_Quantity
  else 0.00 end as Invoice_Quantity_S,
  
  case
  when a.shkzg = 'H' then a.Invoice_Quantity
  else 0.00 end as Invoice_Quantity_H
  
}
  
