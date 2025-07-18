@AbapCatalog.sqlViewName: 'ZPRO1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'Purchase Details'
define view ZPRO_PUR_ACT_PRICE1 as select from rbkp as a
inner join rseg as b on a.belnr = b.belnr and a.gjahr = b.gjahr

{
  a.belnr as belnr,
  a.gjahr as gjahr,
  a.blart as blart,
  a.budat as budat,
  a.bukrs as bukrs,
  a.lifnr as lifnr,
  a.waers as waers,
  a.rmwwr as rmwwr,
  b.ebeln as ebeln,
  b.ebelp as ebelp,
  b.matnr as matnr,
  b.bwtar as bwtar,
  b.werks as werks,
  b.wrbtr as wrbtr,
  b.shkzg as shkzg,
  b.menge as menge,
  b.tbtkz as tbtkz,
  case
  when b.shkzg = 'H' then b.menge
  else 0.00 end as Invoice_Quantity_H,
  case
  when b.shkzg = 'S' then b.menge 
  else 0.00 end as Invoice_Quantity_S 
  
}
  
